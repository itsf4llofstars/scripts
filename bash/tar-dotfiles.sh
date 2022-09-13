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

function slp {
        sleep 4
}

## Exit script immediately if error occurs
set -e

tar_dirname="archives"
tar_fileanme="dotfiles_backup.tar"

err_filename="script-error.txt"
log_dirname="logfiles"

temp_dirname="temp_dots"
tar_filepath="$HOME/archives/dotfiles_backup.tar"
temp_filepath="$HOME/temp_dots"

## Check to see if archive directory exists, exit if it does not.
## Check to see if old tar file exists and delete it if it does.
if [ -d "$HOME"/"$tar_dirname" ]
then
        if [ -f "$tar_filepath" ]
        then
                rm "$tar_filepath"
                echo "old file removed"
        fi
else
        # printf "$(date) $HOME/bashscripts/tar-dotfiles.sh ERROR: 1\n" >> "$HOME"/"$log_dirname"/"$err_filename"
        echo "Error: 1 logged"
        exit
fi
slp

# Check if temporary directory exists, delete any files if it does
# create if if doesn't
if [ ! -d "$temp_filepath" ]
then
        mkdir "$temp_filepath"
        echo "$temp_filepeath created."
fi
slp

# Copy the dot files.
if [ -d "$temp_filepath" ]
then
        cp "$HOME"/.bashrc "$HOME"/"$temp_dirname"/bashrc.bak
        cp "$HOME"/.bash_aliases "$HOME"/"$temp_dirname"/bash_aliases.bak
        cp "$HOME"/.vimrc "$HOME"/"$temp_dirname"/vimrc.bak
        cp "$HOME"/.tmux.conf "$HOME"/"$temp_dirname"/tmux.conf.bak
        cp "$HOME"/.gitconfig "$HOME"/"$temp_dirname"/gitconfig.bak
        cp "$HOME"/.nanorc "$HOME"/"$temp_dirname"/nanorc.bak
        # cp "$HOME"/. "$HOME"/"temp_dirname"/
        echo "Files copies"
fi
slp

if [ -f "$temp_filepath"/bashrc.bak ]
then
        tar -cf "$tar_filepath" "$temp_dirpath"/*.bak
        echo "Archive created"
else
        echo "Error: 2"
fi
slp

if [ -f "$tar_filepath" ]
then
        rm "$HOME"/"$temp_dirname"/*
        rm -r "$HOME"/"$temp_dirname"
        echo "Erased"
fi

exit

