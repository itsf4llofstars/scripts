#!/usr/bin/env bash

#: TITLE:       reboot.sh
#: DATE:        22/09/08 - YMD
#: AUTHOR:      GitHub: itsf4llofstars
#: VERSION:     0.2.0
#: DESCRPTION:  Logs a single line reboot message to a log text file
#: OPTIONS:     -h, --help,

#: Display help text. This is ment to be viewed via the command line with:
#: $ ./reboots.sh -h, --help
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    clear
    cat <<EOF
Logs a single line reboot message with date and time of reboot to a log text
file. Good for being called by a crontab schedule.

If included see additional reboot.md file for additional notes.

crontab example
@reboot "\$HOME"/path(s)_to_script/reboot.sh

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
## You will need to change the path and file.ext to your log-path and log
## filename.
echo "$(date +'%FT%R:%S%:::z')00: $0 [re]boot" >> "$HOME"/path/.../file.ext

exit
