# Placing A Script File Into Your Personnal path

```
$ vim .bashrc
```

Add:

> export PATH="$HOME"/bin:$PATH
<br>
> PATH=$PATH:"$HOME"/.local/bin

to your .bashrc file.<br><br>

Navigate to your bin directory in your home directroy.<br>

```
$ cd ~/bin
```

Lets say your bash script named funscript.sh is in your bashfiles, coolscrpts, directory. Create a sim-link from bin
to bashfiles, coolscripts, funscript.sh<br>

> /home/user/bin/
<br>
to<br>
> /home/user/bashfiles/coolscripts/funscript.sh

```
$ cp -s ../bashfiles/coolscripts/funscripts.sh ./fs
```

Now to run the funscript.sh script form anywhere in your file system you can simply type:

```
$ fs
```

at the command prompt.

