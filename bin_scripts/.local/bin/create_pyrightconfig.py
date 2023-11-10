#!/usr/bin/env python3

import json
import os
import sys


def main():
    """Get the current path and try to create a correct pyright config file"""
    VERSION_FILE = ".python-version"
    PYRIGHT_FILE = "pyrightconfig.json"
    pyright_root = os.environ.get("PYENV_ROOT")
    if not pyright_root:
        print("env var PYENV_ROOT is not set. exiting.")
        sys.exit(1)
    if not os.path.exists(VERSION_FILE):
        print("Version file is not found. Please do pyenv local <name-of-venv>")
        sys.exit(1)
    with open(VERSION_FILE) as f:
        venv_name = f.read().strip()
    with open(PYRIGHT_FILE, "w") as f:
        json.dump(
            {
                "venvPath": os.path.join(pyright_root, "versions"),
                "venv": venv_name,
            },
            f,
        )
    print(f"Written down to {PYRIGHT_FILE}")


if __name__ == "__main__":
    main()

