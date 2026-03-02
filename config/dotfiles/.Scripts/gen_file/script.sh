#!/usr/bin/env bash
set -euo pipefail

DIR="$HOME/Work/Data"
FILENAME="$(date '+%d-%m-%Y').md"
FILEPATH="$DIR/$FILENAME"

# make sure folder exists
mkdir -p "$DIR"

# create file only if it doesn't exist
if [ ! -e "$FILEPATH" ]; then
    cat > "$FILEPATH" <<EOF
# Journal — $FILENAME

Created: $(date '+%Y-%m-%d %H:%M:%S')

## Today
- 

EOF
fi

# ALWAYS open file
exec nvim "$FILEPATH"
