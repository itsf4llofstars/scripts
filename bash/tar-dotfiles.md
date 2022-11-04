# tar-dotfiles.sh

This script creates a temporary directory called temp_dots and copies core dotfilesfrom the home<br>
directory to the temporary directory. The script will then create a non-zipped tar-ball in the<br>
archives directory. The will delete any occurance of the temp_dots and or the tar file if either<br>
should exists when the script is run. This will ensure that old date is cleaned before creating a<br>
new tar file. The last line of the script prints to a file for logging purposes. This log print<br>
does not neccesarily mean that the tar file was created but that the script did no exit prior to<br>
the logging print line. The user will have to ensure that path to the logfile exists.

<br>

---
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

> n n n n n "\$HOME"/path_to_script/tar-dotfiles.sh >> "\$HOME"/path_to_log/logfile

See [Cron Guru](https://www.cronguru.com) for a better understanding of setting crontab times.<br>

Runnig the script with the -h or --help option,

```
$ ./tar-dotfiles.sh [-h|--help]
```

Will clear the terminal and print a short help text. The script will not create the tar file if<br>
the -h or --help options are passed.<br>


<br>

---
## Script Maintenance

The script should be setup so as to only have to change the Constant filename and pathname<br>
variables section to the names you wish. Also you change, add or subtract additional files in<br>
section where the dot files are copied to the TEMP_PATH variable. A commented line has been added<br>
to ease files addition.

> \# cp "\$HOME"/.file "$TEMP_PAtH"/file.bak

I'm sure there better ways for creating this type of tar. Till we explore them it is reccomened to<br>
not forgo the the script deleting old directories and old tar files. This ensures that your<br>
archive has the most up to date file data.

<br>

---
## The Script

Below is the script minus the help menu and documentation.<br><br>
```
#!/usr/bin/env bash

ARCHIVE_PATH="$HOME/archives"
ARCHVIE_FILE="dotfiles-backup.tar"
ARCHIVE_PATHFILE="$HOME/archives/dotfiles-backup.tar"
TEMP_PATH="$HOME/temp_dots"
LOG_FILE="$HOME/logfiles/script_error.txt"

if [ -d "$TEMP_PATH" ]; then
        rm -r "$TEMP_PATH"
        mkdir "$TEMP_PATH"
fi

if [ -d "$TEMP_PATH" ]; then
        cp "$HOME"/.bashrc "$TEMP_PATH"/bashrc.bak
        cp "$HOME"/.bash_aliases "$TEMP_PATH"/bash_aliases.bak
        cp "$HOME"/.vimrc "$TEMP_PATH"/vimrc.bak
        cp "$HOME"/.nanorc "$TEMP_PATH"/nanorc.bak
        cp "$HOME"/.gitconfig "$TEMP_PATH"/gitconfig.bak
        cp "$HOME"/.tmux.conf "$TEMP_PATH"/tmux.conf.bak
        # cp "$HOME"/. "$TEMP_PATH"/.bak
fi

if [ -f "$ARCHIVE_PATHFILE" ]; then
        rm "$ARCHIVE_PATHFILE"
fi

cd "$TEMP_PATH"
tar -cf "$ARCHIVE_PATHFILE" .
cd "$HOME"

if [ -f "$ARCHIVE_PATHFILE" ]; then
        rm -r "$TEMP_PATH"
fi

printf "$(date +'%FT%R:%S%::z')00: $0" >>"$HOME"/logfiles/cron.log 2>&1

```

