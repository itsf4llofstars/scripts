# reboot.sh

The reboot.sh script echoes a message to a directory path and file name. It can be used in a crontab<br>
to log each boot or re-boot of your computer.<br>

The user will need to change the output path of the echo command, "directory/.../" to the path of<br>
the file. Also, change "file.ext" to the filename you want to log to. A file extension may not be<br>
needed<br>

---
## Working With the Script

You will need to change the path and filename to the path and file name of you logfile. This change<br>
should be done on the echo line, see example line below:<br>

echo "$(date +'%FT%R:%S%:::z')00: $0 [re]boot" >> "$HOME"/ <- include your path and filename here<br>

> echo "$(date +'%FT%R:%S%:::z')00: $0 [re]boot" >> "$HOME"/logfiles/reboot_log.txt 2>&1

Any errors occuring with the echo command will also be sent to the logfile if you include 2>&1 at<br>
then end of the echo command, as seen above.<br>

The set -e line is not needed and is safe to delet.<br>

---
## Running

This script can be called manually with:

```
$ ./reboot.sh
$ ./reboot.sh -h
$ ./reboot.sh --help
```

Calling the scritp with the -h or --help options will not log a reboot message. The -h or --help<br>
options clears the terminal and prints a simple help text to the screen.

## Using Cron

If you have a cron scheduler you can use this script in that service.<br>
Launch crontab with:

```
$ crontab -e
```

crontab example:

> @reboot "$HOME"/path(s)_to_script/reboot.sh
>
> @reboot "$HOME"/crons/reboot.sh >> "$HOME"/logfiles/crontab.log 2>&1

Use [Google](https://www.google.com) or [duckduckgo](https://www.duckduckgo.com) to search on how to install a cron scheduler and how to enable<br>
the cron daemon.
