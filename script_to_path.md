# Placing A Script File Into Your Personnal path

Open your .bashrc file using your editor of chioce.<br>

```bash
$ vim .bashrc
```

Add:

> export PATH="$HOME"/bin:$PATH
<br>
> PATH=$PATH:"$HOME"/.local/bin

to your .bashrc file.<br>

Save and exit your .bashrc, and reload bash.<br>

```bash
$ exec bash
```

Navigate to your bin directory in your home directory. You may have to create the bin directory in your home directory.<br>

```bash
$ cd ~/bin
```

Lets say your bash script named fun_script.sh is in your bashfiles, coolscrpts, directory. Create a sim-link from bin
to bashfiles, coolscripts, fun_script.sh<br>

from
> /home/user/bin/
<br>
to<br>
> /home/user/bashfiles/coolscripts/funscript.sh

```bash
~/bin $ cp -s ../bashfiles/coolscripts/funscripts.sh ./fs
```

Now to run the fun_script.sh script form anywhere in your file system you can simply type:

```bash
$ fs
```

at the command prompt.

