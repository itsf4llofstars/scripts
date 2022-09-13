#!/usr/bin/env bash

ARCHIVE_PATH="$HOME/archives"
ARCHVIE_FILE="dotfiles-backup.tar"
ARCHIVE_PATHFILE="$HOME/archives/dotfiles-backup.tar"
TEMP_PATH="$HOME/temp_dots"

if [ -d "$TEMP_PATH" ]
then
        rm -r "$TEMP_PATH"
        echo "temp_dots dir rmvd"
fi

if [ ! -d "$TEMP_PATH" ]
then
        mkdir "$TEMP_PATH"
        echo "temp_dots dir created"
fi

if [ -d "$TEMP_PATH" ]
then
        cp "$HOME"/.bashrc "$TEMP_PATH"/bashrc.bak
        cp "$HOME"/.bash_aliases "$TEMP_PATH"/bash_aliases.bak
        cp "$HOME"/.vimrc "$TEMP_PATH"/vimrc.bak
        cp "$HOME"/.nanorc "$TEMP_PATH"/nanorc.bak
        cp "$HOME"/.gitconfig "$TEMP_PATH"/gitconfig.bak
        cp "$HOME"/.tmux.conf "$TEMP_PATH"/tmux.conf.bak
fi

if [ -f "$ARCHIVE_PATHFILE" ]
then
        rm "$ARCHIVE_PATHFILE"
        echo "old tar rmvd"
fi

cd "$TEMP_PATH"
tar -cf "$ARCHIVE_PATHFILE" .

