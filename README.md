<p align="center">
  <img src="https://imgur.com/KEvaVTP.jpg" width="250px"></img>
</p>
<p align="center">
  <em>Inspired by</em>
  <a href="https://github.com/cknadler/vim-anywhere">cknadler/vim-anywhere</a>
</p>

<p align="center">
  <img src="https://thumbs.gfycat.com/PlumpDeadlyAlpinegoat-size_restricted.gif" width="500px"></img>
  <h2>What it does</h2>
  A keyboard shortcut of your choosing creates a temporary frame and buffer. The text is automatically inserted into the application you&apos;re using. Bust your moves on the fly, with fewer keystrokes. Invoke the shortcut with selected text and it will be replaced.
</p>




## Install ##
### OSX ###
``` bash
curl -fsSL https://raw.github.com/zachcurry/emacs-anywhere/master/install | bash
```
Open **System Preferences** and navigate to **keyboard > shortcuts > Services**. Check the box beside "Emacs Anywhere" and click "Add Shortcut" and key a shortcut.

### Linux ###
>### dependencies: **xdotool**, **xclip** ###
>Install as needed
>``` bash
>sudo apt-get install xdotool
>```
>``` bash
>sudo apt-get install xclip
>```
>**Wayland** window manager is **not supported**. You can **switch** your window manager in **Ubuntu** by going to the login screen and selecting **Xorg** as your window manager.

<p align="center">
  <img src="https://imgur.com/DrVbpRX.jpg" width="500px"></img>
</p>


#### Installation ####


``` bash
curl -fsSL https://raw.github.com/zachcurry/emacs-anywhere/master/install | bash
```
Create a keyboard shortcut with this command `$HOME/.emacs_anywhere/bin/run`

### Windows ###
TBD

## How to ##
Invoke the shortcut with a running Emacs server. A new frame will be created and display an empty buffer titled `*Emacs Anywhere*`. When the frame is deleted the buffer's content is inserted into the application you're using and the buffer is deleted. Any text selected when the keyboard shortcut is invoked will be replaced.

## Configure ##
**Emacs Anywhere** keeps it's configurations in `~/.emacs_anywhere/config`. You can use the `EA_EDITOR` variable to control the path used to invoke **emacsclient** as well as the options passed to it. You can also toggle the copy/paste behavior by using the `EA_SHOULD_COPY` and `EA_SHOULD_PASTE` variables. It is important that you place your configurations in the `~/.emacs_anywhere/config` instead of one of your dotfiles, especially if you are using OSX!

## Update ##
``` bash
~/.emacs_anywhere/update
```

## Uninstall ##
``` bash
~/.emacs_anywhere/uninstall
```

## Troubleshooting ##
If **Emacs Anywhere** is not launching double check your keyboard shortcut is set properly and if that looks okay set the `EA_EDITOR` explicitly in `~/.emacs_anywhere/config`.

If you are using Linux and and the copy/paste features aren't working as expected, there is a good chance **xdotool** or **xclip** do not work properly in your environment. Soon, we will add some test scripts to the repo to allow you to easily test that these dependencies are working.

If all else fails you can run `~/.emacs_anywhere/bin/run` and read the output. 

## Slow? ##
If your Emacs server isn't running when you use the keyboard shortcut, **Emacs Anywhere** will try to start it (this is slower). Run Emacs as a daemon (`emacs --daemon`) to start your server from the command line, or use `server-start` command in Emacs. Once you've a got a running server, new frames are created much faster.

## TODO ##
- Emacs command to toggle **Emacs Anywhere**
- Homebrew
- Windows

## Contributing ##
TBD

Copyright © 2018, Zach Curry, All rights reserved.
