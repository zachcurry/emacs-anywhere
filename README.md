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
  A keyboard shortcut, of your choosing, creates a temporary frame and buffer. The text is auto-magically injected into the application your using. Bust your E-moves on-the-fly, with fewer keystrokes. Invoke with selected text and it will auto-magically be replaced.
</p

<p>
  <img align="right" src="https://imgur.com/NqJWBxD.jpg" width="500"></img>
  <h2>Install</h2>
  <ol>
    <li><a href="https://raw.githubusercontent.com/zachcurry/emacs-anywhere/master/Emacs%20Anywhere.dmg">Download the installer</a></li>
    <li>Drag and drop</li>
    <li>Add keyboard shortcut</li>
  </ol>
</p>

## How to ##
If your Emacs server is not running, Emacs Anywhere will start it before it opens the new, temporary frame. The frame is always opened to an empty buffer initially. When you delete the frame, the buffer's content is auto-magically injected into the application you are using, and the buffer is deleted. Any text selected when the keyboard shortcut is invoked will be replaced.

**YOU DO NOT NEED TO EDIT TO YOUR `init.el`**!

**Update** by downloading the latest installer, drag and drop.

**Uninstall** by removing `Emacs Anywhere.workflow` in `~/Library/Services`. Emacs Anywhere does not modify any file on your machine. No mess.

Quit a running service by clicking the spinning cog in the taskbar and invoking the `ea-clipboard` command from Emacs.

## Issues? ##
If your Emacs server isn't running when you use the keyboard shortcut, Emacs Anywhere will start it, but it makes the launch process much slower. Run Emacs as a daemon like this `emacs --daemon` to start your server from the command line, or use `server-start` command via Emacs. When the server is running, the new frame launches *real* fast.

If it's not working at all, make sure `emacs` and `emacsclient` are on your `PATH`. Having both executables in `/usr/local/bin` should work without issue.

## Contributing ##
Have a question? Like the tool? Don't like it? Open an issue and let's talk about it! Pull requests are welcome! :nerd_face:

Copyright © 2018, Zach Curry, All rights reserved.
