# reboot.sh

The reboot.sh script echoes a message to a directory path and file name. It can be used in a crontab<br>
to log each boot or re-boot of your computer.<br>

The user will need to change the output path of the echo command, "directory/.../" to the path of<br>
the file. Also, change "file.ext" to the filename you want to log to. A file extension may not be<br>
needed<br>

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

Add:

> @reboot "$HOME"/path(s)_to_script/reboot.sh

to your crontab.<br>

Use [Google](https://www.google.com) or [duckduckgo](https://www.duckduckgo.com) to search on how to install a cron scheduler and how to enable<br>
the cron daemon.
