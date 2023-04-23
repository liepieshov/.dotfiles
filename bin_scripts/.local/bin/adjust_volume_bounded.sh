#!/bin/bash
set -o errexit
 
# The locale may change the decimal point
LC_ALL=C
 
max_volume=65537  # Value of 'volume steps' in $(pacmd list-sinks)
max_percent=120
barwidth=20
sink="$(pacmd dump | grep '^set-default-sink ' | cut -d ' ' -f 2)" 
 
function usage_error {
    echo "Usage: $(basename $0) [+|-]PERCENT|mute|unmute|toggle [SINK]"
    exit 1
}
 
function calc {
    echo "scale=5; $@" | bc
}
 
function int {
    printf '%.0f' "$1"
}
 
function max {
    [ "$1" -gt "$2" ] && echo "$1" || echo "$2"
}
 
function min {
    [ "$1" -lt "$2" ] && echo "$1" || echo "$2"
}
 
function is_number {
    local value="$1"
    echo "$value" | grep -Poq '^[0-9]+(?:\.[0-9]+|)$' && true || false
}
 
function repeat {
    [ $2 -gt 0 ] && printf "$1%.0s" $(seq 1 $2)
}
function get_volume {
    int $(pacmd dump | grep "^set-sink-volume $sink" | cut -d ' ' -f 3)
}
function adjust_volume {
    local adj="$1"
 
    if [[ "${adj:0:1}" = '+' || "${adj:0:1}" = '-' ]]; then
        # Relative volume
        local sign="${adj:0:1}"
        local percent="${adj:1}"
        is_number "$percent" || usage_error
        local adjustment="$(calc "$max_volume * $percent/100")"
        local new_volume="$(max 0 $(int $(calc "$(get_volume) $sign $adjustment")))"
    elif is_number "$adj"; then
        # Absolute volume
        local new_volume="$(int $(calc "$max_volume * $adj/100"))"
    else
        usage_error
    fi
 
    local max_allowed="$(int $(calc "$max_volume * $max_percent/100"))"
    pacmd set-sink-volume "$sink" "$(min $max_allowed $new_volume)"
}
adjust_volume "$1"
