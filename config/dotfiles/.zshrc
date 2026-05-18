#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#
# -----------------------------------------------------
# Zshrc Loader
# -----------------------------------------------------


ZSHRC_DIR="$HOME/itslinux-btw/config/configfiles/zshrc"

# Check if directory exists
[ -d "$ZSHRC_DIR" ] || return

# Loop through files
for f in "$ZSHRC_DIR"/*; do
    [ -f "$f" ] || continue
    source "$f"
done

