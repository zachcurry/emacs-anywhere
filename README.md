<p align="center">
  <img src="https://imgur.com/KEvaVTP.jpg" width="250px"></img>
</p>
<p align="center">
  <em>Inspired by</em>
  <a href="https://github.com/cknadler/vim-anywhere">cknadler/vim-anywhere</a>
</p>

<p>
  <img align="right" src="https://thumbs.gfycat.com/PlumpDeadlyAlpinegoat-size_restricted.gif" width="500px"></img>
  <h2>What it does</h2>
  A keyboard shortcut of your choosing creates a temporary frame and buffer. The text is automatically inserted into the application you&apos;re using. Bust your moves on the fly, with fewer keystrokes. Invoke the shortcut with selected text and it will be replaced.
</p>

## Install ##
### OSX ###
1. Clone the repo
``` bash
git clone https://github.com/zachcurry/emacs-anywhere.git
```
2. Run the install script
``` bash
./emacs-anywhere/install
```
3. Open System Preferences and navigate to `keyboard > shortcuts > Services`. Check the box beside "Emac Anywhere" and click "Add Shortcut" and key a shortcut.

### Linux (alpha) ###
*The Linux implementation requires* **xdotool** *be installed. Install as needed.*
``` bash
sudo apt-get xdotool
```
1. Clone the repo
``` bash
git clone https://github.com/zachcurry/emacs-anywhere.git
```
2. Run the install script
``` bash
./emacs-anywhere/install
```
3. Create a keyboard shortcut with this command `$HOME/.emacs_anywhere/bin/run`

### Windows ###
TBD

## How to ##
Invoke the shortcut. A new frame will be created and display an empty buffer titled `*Emacs Anywhere*`. When the frame is deleted the buffer's content is inserted into the application you're using and the buffer is deleted. Any text selected when the keyboard shortcut is invoked will be replaced.

Uninstall **Emacs Anywhere** by running the `uninstall` script in the root of the repo
``` bash
./uninstall
```

## Slow? ##
If your Emacs server isn't running when you use the keyboard shortcut **Emacs Anywhere** will start it, but this slow. Run Emacs as a daemon (`emacs --daemon`) to start your server from the command line, or use `server-start` command in Emacs. Once you've a got a running server new frames are created much faster.

## TODO ##
- Emacs command to toggle **Emacs Anywhere**
- Homebrew
- Windows

## Contributing ##
Have a question? Like the tool? Don't like it? Open an issue and let's talk about it! Pull requests are appreciated!

Copyright © 2018, Zach Curry, All rights reserved.
