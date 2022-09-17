#!/usr/bin/env bash

#: TITLE:      mod.sh
#: DATE:       22/09/16 ymd
#: AUTHOR:     GitHub: itsf4llofstars
#: VERSION:    0.1.0
#: DESCRPTION: Change the permissions of a file to 755
#: OPTIONS:    -h, --help,

#: Display help text
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    clear
cat << EOF
This will change the permissions of a file to 755,
making the file an executable.

Calls: For scripts not in the path
$ ./mod.sh [options]

Calls: For scripts in the path
$ mod [options]

options
    -h, --help  This help text.
EOF
    exit 0
fi

if [ -f "$1" ]; then
    # chmod 755 "$1"
    echo "$(date) File: $1 permissions to 755" >> "$HOME"/logfiles/null.txt
elif [ ! -f "$1" ]; then
    echo "The file: $1 was not found."
    echo "$(date) The file: $1 was not found." >> "$HOME"/logfiles/null.txt
fi

exit

