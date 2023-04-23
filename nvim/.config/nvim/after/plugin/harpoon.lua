local nmap = function(keys, func, desc)
    if desc then
        desc = "Harpoon keymap: " .. desc
    end

    vim.keymap.set("n", keys, func, { desc = desc, noremap = true })
end
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- left index finger
nmap("<leader><space>f", ui.toggle_quick_menu, "open quick menu")
-- lift the finger to do sth "dangerous"
nmap("<leader><space>h", mark.add_file, "set mark")
-- right home row, no finger lifting required
nmap("<leader><space>j", function()
    ui.nav_file(1)
end, "choose 1 file")
nmap("<leader><space>k", function()
    ui.nav_file(2)
end, "choose 2 file")
nmap("<leader><space>l", function()
    ui.nav_file(3)
end, "choose 3 file")
nmap("<leader><space>;", function()
    ui.nav_file(4)
end, "choose 4 file")
