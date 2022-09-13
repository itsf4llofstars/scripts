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
Adds common dotfiles (configuration files) to a tar file
in an directory of the user choice. Good if used with crontab scheduler.

If included see tar-dotfiles.md file for additional notes.

Call:
$ ./tar-dotfile.sh [options]

options
    -h, --help  This help text.
EOF
    exit
fi

## Exit script immediately if error occurs
set -e

tar_fileanme="dotfiles_backup.tar"
tar_dirname="archives"

# Check to see if archive directory exists, exit if it does not.
# Check to see if old tar file exists and delete it if it does.
if [ -d "$HOME"/"$tar_dirname" ]
then
        if [ -f "$HOME"/"$tar_dirname"/"$tar_filename" ]
        then
                rm "$HOME"/"$tar_dirname"/"$tar_filename"
        else
                #TODO: We could log is output
                printf "File: $tar_filename does not exist\n"
        fi
else
        # TODO: We could log is output
        printf "Directory: $tar_dirname does not exist. Exiting!\n"
        exit
fi

temp_dirname="temp_dots"

# Check if temporary directory exists, delete any files if it does
# create if if doesn't
if [ -d "$HOME"/"$temp_dirname" ]
then
        rm "$HOME"/"$temp_dirname"/*
else
        mkdir "$HOME"/"$temp_dirname"
fi

exit
