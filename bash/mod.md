# mod.sh

The mod.sh script will take a filename as a command line attribute and if that file exists it will change it's<br>
permissions to 755, making the file an executable.

## Executing the script

When calling the scipt without it being in the users path you will either have to have the script and the file you wish
to change in the same directory...

> /home/user/bash_files/script.sh

and call it with:

```
$ ./mod.sh script.sh
```

or if mod.sh is in a different diredtory you can point to the file with absolute or relative paths.

```
$ ./mod.sh ../../bash_files/srcript.sh

$ ./mod.sh /home/user/bash_files/script.sh

$ ./mod.sh ~/bash_files/scripts.sh
```

### Examples

If you are in the present working directory of,<br>

```
$ pwd
```

> $HOME/github/scripts

and your mod.sh script is in this directory as well.<br>
If the file whose permissions you want to change is located in.<br>

> $HOME/bashscripts/oneliners/print_date.sh

To change the permissions of print_date.sh enter.<br><br>

```
$ ./mod.sh ~/bashscritps/oneliners/print_date.sh
```
<pre>   or</pre>
```
$ ./mod.sh "$HOME"/bashscritps/oneliners/print_date.sh
```
<pre>   or</pre>
```
$ ./mod.sh ../../bashscritps/oneliners/print_date.sh
```

