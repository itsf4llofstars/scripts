#!/usr/bin/env bash

#: TITLE:       tar-dotfiles.sh
#: DATE:        22/09/08 - YMD
#: AUTHOR:      GitHub: itsf4llofstars
#: VERSION:     0.1.0
#: DESCRPTION:  Creates a tar archives of common dot files
#: OPTIONS:     -h, --help,

#: Display help text
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    clear
    cat <<EOF


Call:
$ ./reboot.sh [options]

options
    -h, --help  This help text.
EOF
    exit
fi

## Exit script immediately if error occurs
set -e

## Output date time to log text file
echo "[$(date +'%FT%R:%S%:::z')00] ~/bashscripts/reboot.sh (Raspberry pi 4 [re]boot)" >>"$HOME"/directory/.../file.ext

exit
