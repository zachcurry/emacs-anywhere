<p align="center">
  <img src="https://imgur.com/KEvaVTP.jpg"></img>
</p>
<p align="center">
  <em>Inspired by</em>
  <a href="https://github.com/cknadler/vim-anywhere">cknadler/vim-anywhere</a>
</p>
<p align="center">
  <img src="https://thumbs.gfycat.com/DefiantMindlessLangur-size_restricted.gif"></img>
</p>


## What it does ##
Emacs Anywhere launches a throw-away Emacs process, copies the current buffer to your clipboard on exit, making it easy to    input superior text into an inferior application. Currently available for GNU Emacs on OSX.

## Install ##
1. Copy `emacs_anywhere.workflow` to `~/Library/Services`
2. Create keyboard shortcut `Keyboard->Shortcuts->Services->emacs_anywhere`. Consider using <kbd>&#x21E7;</kbd> <kbd>&#8984;</kbd> <kbd>Space</kbd> if you bust your moves in evil-mode :metal:

Note: Emacs must be installed such that running `open -a emacs` in the terminal launches Emacs.

## How it works ##
It's an OS X service you map to a keyboard shortcut. It runs a bash script to open Emacs with a touch of elisp passed in via `--eval` command line option.

:sparkles:
```elisp
(progn
  (switch-to-buffer "*scratch*")
  (add-hook
    'kill-emacs-hook
    (lambda ()
      (clipboard-kill-ring-save
        (point-min)
        (point-max)))))
```
:sparkles:

The implementation is so tiny it barely warrants a repository! It's just one service, wrapping one bash command, wrapping one sexp :neutral_face:

## Inspiration ##
I wanted to use [cknadler/vim-anywhere](https://github.com/cknadler/vim-anywhere) for this purpose but didn't want to install MacVim to use it. I already had the *best* Vim. **\#emacs** **\#evil**
