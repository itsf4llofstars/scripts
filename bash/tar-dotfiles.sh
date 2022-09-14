#!/usr/bin/env bash

##: TITLE:       tar-dotfiles.sh
##: DATE:        22/09/08 - YMD
##: AUTHOR:      GitHub: itsf4llofstars
##: VERSION:     0.1.0
##: DESCRPTION:  Creates a tar archives of common dot files
##: OPTIONS:     -h, --help,

##: Display help text
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

## Constant filename and pathname variables
ARCHIVE_PATH="$HOME/archives"
ARCHVIE_FILE="dotfiles-backup.tar"
ARCHIVE_PATHFILE="$HOME/archives/dotfiles-backup.tar"
TEMP_PATH="$HOME/temp_dots"
LOG_FILE="$HOME/logfiles/script_error.txt"

## Checks if TEMP_PATH exists and deletes it if it does
# if [ -d "$TEMP_PATH" ]; then
#         rm -r "$TEMP_PATH"
# fi

## If the TEMP_PATH does not exist it is created here
if [ ! -d "$TEMP_PATH" ]; then
        mkdir "$TEMP_PATH"
fi

## Checks if TEMP_PATH exists and if so copies the dot files
## to TEMP_PATH renaming theme as *.bak files
if [ -d "$TEMP_PATH" ]; then
        cp "$HOME"/.bashrc "$TEMP_PATH"/bashrc.bak
        cp "$HOME"/.bash_aliases "$TEMP_PATH"/bash_aliases.bak
        cp "$HOME"/.vimrc "$TEMP_PATH"/vimrc.bak
        cp "$HOME"/.nanorc "$TEMP_PATH"/nanorc.bak
        cp "$HOME"/.gitconfig "$TEMP_PATH"/gitconfig.bak
        cp "$HOME"/.tmux.conf "$TEMP_PATH"/tmux.conf.bak
        # cp "$HOME"/. "$TEMP_PATH"/.bak
fi

## Checs if tar file exists in ARCHIVE_PATHFILE and deletes it if it doex
if [ -f "$ARCHIVE_PATHFILE" ]; then
        rm "$ARCHIVE_PATHFILE"
fi

## Changes working directory to TERMP_PATH and creates the tar file
## in ARCHIVE_PATHFILE
cd "$TEMP_PATH"
tar -cf "$ARCHIVE_PATHFILE" .
cd "$HOME"

## Removes the TEMP_PATH if the tar file was created
if [ -f "$ARCHIVE_PATHFILE" ]; then
        rm -r "$TEMP_PATH"
fi

## Logs scritp run to a log file
printf "$(date +'%FT%R:%S%::z')00 $HOME/bashscripts/tar-dotfiles.sh\n" >>"$HOME"/logfiles/cron.log 2>&1

