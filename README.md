<p align="center">
  <img src="https://imgur.com/KEvaVTP.jpg"></img>
</p>
<p align="center">
  <em>Inspired by</em>
  <a href="https://github.com/cknadler/vim-anywhere">cknadler/vim-anywhere</a>
</p>

<p>
  <img align="right" src="https://thumbs.gfycat.com/DefiantMindlessLangur-size_restricted.gif" width="500px"></img>
  <h2>What it does</h2>
  Use a system keyboard shortcut to launch a new, disposable frame that automatically copies the current buffer to the system clipboard when you close it. Bust your E-moves on-the-fly with fewer keystrokes. Change the behavior mid-session with the <strong>interactive command</strong>.
</p

<p>
  <img align="right" src="https://imgur.com/T8a0Cwi.jpg" width="500"></img>
  <h2>Install</h2>
  <ol>
    <li><a href="https://raw.githubusercontent.com/zachcurry/emacs-anywhere/master/Emacs%20Anywhere.dmg">Download and open the installer</a></li>
    <li>Drag and drop</li>
    <li>Choose a keyboard shortcut</li>
  </ol>
</p>

## How to ##
Emacs Anywhere keyboard shortcut will *always* launch a new, disposable, frame. Simply kill Emacs when your done editing and the current buffer will be copied to your clipboard. **YOU DO NOT NEED TO EDIT TO YOUR `init.el`**!

Turn the copy to clipboard behavior off mid-session using the <kbd>M-X</kbd> `ea-clipboard` **interactive command**.

**Upgrade** by downloading the latest installer and repeating the first install step.

**Uninstall** by deleting `Emacs Anywhere.workflow` in `~/Library/Services`. Emacs Anywhere does not modify any file on your machine. No mess.

## Problem launching? ##
For it to work `Emacs.app` (or an alias/link) must exist in `/Applications` directory. Test this by typing "emacs" in Spotlight, or run `open -a emacs` in Terminal.

##### Emacs Anywhere is *powered by* :sparkles: elisp :sparkles: #####

Copyright © 2018, Zach Curry, 
All rights reserved.
