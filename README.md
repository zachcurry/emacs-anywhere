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
  A keyboard shortcut of your choosing creates a temporary frame and buffer. The text is automatically inserted into the application your using. Bust your moves on the fly, with fewer keystrokes. Invoke the shortcut with selected text and it will be replaced.
</p

<p>
  <img align="right" src="https://imgur.com/NqJWBxD.jpg" width="500"></img>
  <h2>Install (OSX)</h2>
  <ol>
    <li><a href="https://raw.githubusercontent.com/zachcurry/emacs-anywhere/master/Emacs%20Anywhere.dmg">Download the installer</a></li>
    <li>Drag and drop or double-click</li>
    <li>Add a keyboard shortcut</li>
  </ol>
  <h2>Install (Windows)</h2>
  <strong>TBD</strong>
  <h2>Install (Linux)</h2>
  <strong>TBD</strong>
</p>

## How to ##
Invoke the shortcut. A new frame will be created and display an empty buffer titled `*Emacs Anywhere*`. When the frame is deleted the buffer's content is inserted into the application you're using and the buffer is deleted. Any text selected when the keyboard shortcut is invoked will be replaced.

**YOU DO NOT NEED TO EDIT TO YOUR `init.el`**!

Update **Emacs Anywhere** by downloading the latest installer and replacing the service.

Uninstall **Emacs Anywhere** by removing `Emacs Anywhere.workflow` in `~/Library/Services`.

You can quit a running service by clicking the spinning cog in the taskbar. Invoking the `ea-clipboard` command from Emacs will allow you to override the copy to cipboard behavior.

## Issues? ##
If your Emacs server isn't running when you use the keyboard shortcut **Emacs Anywhere** will start it, but this slow. Run Emacs as a daemon (`emacs --daemon`) to start your server from the command line, or use `server-start` command in Emacs. Once you've a got a running server new frames are created much more quickly.

If **Emacs Anywhere** isn't working, verify that `emacs` and `emacsclient` are in your `PATH` environment variable. A safe bet would be to put both executables in `/usr/local/bin`.

## Contributing ##
Have a question? Like the tool? Don't like it? Open an issue and let's talk about it! Pull requests are welcome! :nerd_face:

I sincerely appreciate the help I've had thus far!

Copyright © 2018, Zach Curry, All rights reserved.
