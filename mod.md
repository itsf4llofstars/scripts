# mod.sh

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

