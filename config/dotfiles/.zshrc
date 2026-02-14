#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#
# -----------------------------------------------------
# Zshrc Loader
# -----------------------------------------------------

# DON'T CHANGE THIS FILE

# You can define your custom configuration by adding
# files in ~/.config/zshrc
# or by creating a folder ~/.config/zshrc/custom
# with copies of files from ~/.config/zshrc
# -----------------------------------------------------

# -----------------------------------------------------
# Load modular configuration
# -----------------------------------------------------


# Use $HOME instead of ~ to ensure the path expands correctly
ZSHRC_DIR="$HOME/itslinux-btw/config/zshrc"

# Check if directory exists
[ -d "$ZSHRC_DIR" ] || return

# Loop through files
for f in "$ZSHRC_DIR"/*; do
    [ -f "$f" ] || continue
    source "$f"
done

. "$HOME/.local/bin/env"
