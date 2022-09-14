# tar-files.sh

This script creates a temporary directory called temp_dots and copies core dotfilesfrom the home<br>
directory to the temporary directory. The script will then create a non-zipped tar-ball in the<br>
archives directory. The will delete any occurance of the temp_dots and or the tar file if either<br>
should exists when the script is run. This will ensure that old date is cleaned before creating a<br>
new tar file.

## Running tar-dotfiles.sh

The script can be run by typing:

```
$ ./tar-dotfiles.sh
```

from within the files directory. If the script is in the path:

```
$ tar-dotfiles.sh
```

from any directory will run the script. Should you want to run it as a cron in crontab, set you<br>
crontab -e as follows.

> \* \* \* \* \* "\$HOME"/path_to_script/tar-dotfiles.sh >> "\$HOME"/path_to_log/logfile

Sed [Cron Guru](https://www.cronguru.com) for a better understanding of setting crontab times.

## Script Maintenance

The script should be setup so as to only have to change the Constant filename and pathname
variables<br>
section to the names you wish. Also you change, add or subtract additional files in section where
the dot files are copied to the TEMP_PATH variable. A commented line has been added to ease files
addition.

> # cp "$HOME"/.file "$TEMP_PAtH"/file.bak

I'm sure there better ways for creating this type of tar. Till we explore them it is reccomened to
not forgo the the script deleting old directories and old tar files. This ensures that your archive
has the most up to date file data.

# {{{ SCRIPT
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
# }}}
