#!/usr/bin/env bash

#: TITLE:      mod.sh
#: DATE:       22/09/16 ymd
#: AUTHOR:     GitHub: itsf4llofstars
#: VERSION:    0.1.0
#: DESCRPTION: Change the permissions of a file to 755
#: OPTIONS:    -h, --help, file

#: Display help text
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    clear
    cat <<EOF
This will change the permissions of a file to 755,
making the file an executable.

Calls:
$ ./mod.sh [options]
$ ./mod.sh file

options
    -h, --help  This help text.
    file Name of file for permissions change
EOF
    exit
fi

clear
# checks if there is a filename passed, exits if no filename is passed
if [ -z "$1" ]; then
    echo "A file name is required. Please see help."
    echo "$ ./mod.sh -h, --help"
    echo "No permissions changed."
    exit
fi

# checks if the filename path exists, changes permissions if it does
if [ -f "$1" ]; then
    echo
    chmod -c 755 "$1"
    echo
    echo "$(date) File: $1 permissions to 755" >>"$HOME"/logfiles/null.txt
elif [ ! -f "$1" ]; then
    echo "The file: $1 was not found."
    echo "$(date) File: $1 not found." >>"$HOME"/logfiles/null.txt
fi

exit
