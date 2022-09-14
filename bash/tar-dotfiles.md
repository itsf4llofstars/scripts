# tar-files.sh

```
#!/usr/bin/env bash

ARCHIVE_PATH="$HOME/archives"
ARCHVIE_FILE="dotfiles-backup.tar"
ARCHIVE_PATHFILE="$HOME/archives/dotfiles-backup.tar"
TEMP_PATH="$HOME/temp_dots"
LOG_FILE="$HOME/logfiles/script_error.txt"

# if [ -d "$TEMP_PATH" ]; then
#         rm -r "$TEMP_PATH"
#         echo "$TEMP_PATH removed" >>"$LOG_FILE"
# fi

if [ ! -d "$TEMP_PATH" ]; then
        mkdir "$TEMP_PATH"
        echo "$TEMP_PATH created" >>"$LOG_FILE"
fi

if [ -d "$TEMP_PATH" ]; then
        cp "$HOME"/.bashrc "$TEMP_PATH"/bashrc.bak
        cp "$HOME"/.bash_aliases "$TEMP_PATH"/bash_aliases.bak
        cp "$HOME"/.vimrc "$TEMP_PATH"/vimrc.bak
        cp "$HOME"/.nanorc "$TEMP_PATH"/nanorc.bak
        cp "$HOME"/.gitconfig "$TEMP_PATH"/gitconfig.bak
        cp "$HOME"/.tmux.conf "$TEMP_PATH"/tmux.conf.bak

        echo "Files Copied" >>"$LOG_FILE"
fi

if [ -f "$ARCHIVE_PATHFILE" ]; then
        rm "$ARCHIVE_PATHFILE"
        echo "$ARCHIVE_PATHFILE removed" >>"$LOG_FILE"
fi

cd "$TEMP_PATH"
tar -cf "$ARCHIVE_PATHFILE" .
cd "$HOME"

if [ -f "$ARCHIVE_PATHFILE" ]; then
        rm -r "$TEMP_PATH"
fi

printf "$(date +'%FT%R:%S%::z')00 $HOME/bashscripts/tar-dotfiles.sh\n" >>"$HOME"/logfiles/cron.log 2>&1

```
