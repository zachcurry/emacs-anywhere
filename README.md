<p align="center">
  <img src="https://imgur.com/KEvaVTP.jpg" width="250px"></img>
</p>
<p align="center">
  <em>Inspired by</em>
  <a href="https://github.com/cknadler/vim-anywhere">cknadler/vim-anywhere</a>
</p>
<p align="center">
  <img src="https://thumbs.gfycat.com/HardtofindBelatedAtlanticsharpnosepuffer-size_restricted.gif"
  width="500px">
  </img>
</p>
<p align="center">
  <strong>Emacs Anywhere</strong> provides configurable automation and hooks containing window info, so you can bust moves anywhere in a quick, customizable fashion.
</p>

**Table of Contents**
- [Install](#install)
    - [OS X](#os-x)
    - [Linux](#install)
- [Usage](#usage)
    - [Try It](#try-it)
    - [Environment](#environment)
    - [Commands](#commands)
    - [Variables](#variables)
    - [Hooks](#hooks)
    - [Examples](#examples)
    - [Update](#update)
    - [Uninstall](#uninstall)
- [Todo](#todo)
- [Contributing](#contributing)
- [License](#license)

# Install
## OS X
``` 
curl -fsSL https://raw.github.com/zachcurry/emacs-anywhere/master/install | bash
```
Open **System Preferences** and navigate to **keyboard > shortcuts > Services**.
Check the box beside "Emacs Anywhere", click "Add Shortcut" and key a shortcut.

## Linux
>**Wayland** window manager is **not supported**. You can **switch** your window
manager in **Ubuntu** by going to the login screen and selecting **Xorg** as
your window manager.

### dependencies
Install these dependencies as needed
- **xclip**
- **xdotool**
- **xprop**
- **xwininfo**
```
sudo apt-get install <dependency>
```

### Install
``` 
curl -fsSL https://raw.github.com/zachcurry/emacs-anywhere/master/install | bash
```
Create a keyboard shortcut to run `~/.emacs_anywhere/bin/run`.

## Windows
TBD

# Usage
## Try It
1. Make sure your Emacs server is running. You can start the server like this
```
emacs --daemon
```
2. Focus an application window's text input. A text area in your browser will do.
3. Key the keyboard shortcut you've chosen for **Emacs Anywhere** 
4. Write some text
5. Delete the frame (`C-x 5 0`, or `:q` if you use evil-mode).
**Emacs Anywhere** will copy the text from the buffer "\*Emacs Anywhere\*" to clipboard, delete the
buffer, switch focus to the window from step two and paste the buffers content into the text input.

## Environment
The `EA_EDITOR` environment variable can be used to override the way
**emacsclient** is run. For example, you could put the following statement into
your `.bash_profile`.
```
export EA_EDITOR='emacsclient -a "" -c'
```
With the environment variable set, the invocation will look like this under the
hood
```
emacsclient -a "" -c -e <elisp code>
```
You can prefix **emacsclient** with it's path if **Emacs Anywhere** can't find
it in your `PATH` environment variable.

## Commands
| Command       | Description                                                                                  |
| ----          | -----------                                                                                  |
| **toggle-ea** | If toggled to the "off" state, **Emacs Anywhere** will do nothing when the frame is deleted. |

## Variables
| Variable            | Description                                                                                                                 |
| --------            | -----------                                                                                                                 |
| **ea-on**           | Boolean where `t` and `nil` denote the "on" and "off** states of **Emacs Anywhere**, respectively. The default value is `t` |
| **ea-copy**         | If true, when the frame is deleted the "\*Emacs Anywhere\*" will be copied to clipboard. The default value is `t`        |
| **ea-paste**        | If true, **Emacs Anywhere** will paste to the window from which it was launched. The default value is `t`                   |
| **ea-app-name**     | The name of the application process for the window from which **Emacs Anywhere** was launched.                              |
| **ea-window-title** | The title of the window from which **Emacs Anywhere** was launched.                                                         |
| **ea-x**            | The x-coordinate of the upper-left corner of the window from which **Emacs Anywhere** was launched.                         |
| **ea-y**            | The y-coordinate of the upper-left corner of the window from which **Emacs Anywhere** was launched.                         |
| **ea-width**        | The width of the window from which **Emacs Anywhere** was launched.                                                         |
| **ea-height**       | The height of the window from which **Emacs Anywhere** was launched.                                                        |

>Note: In OS X the window title, position and size information
>is only available if the application is has accessiblity permissions enabled.

## Hooks
| Hook              | Function Signature              | Description                                               |
| ----              | ------------------              | -----------                                               |
| **ea-popup-hook** | (app-name window-title x y w h) | Functions run after an **Emacs Anywhere** session starts. |

## Examples
```elisp
;; Define a function or use a lambda of the same signature
(defun popup-handler (app-name window-title x y w h)
  ;; do stuff
  )

;; Hook your function
(add-hook 'ea-popup-hook 'popup-handler)
```
In your hook function you can do things like set the major mode based on the
application name or window title...
```elisp
(defun github-conversation-p (window-title)
  (or (string-match-p "Pull Request" window-title)
      (string-match-p "Issue" window-title)
      ;; ...
      ))

(defun popup-handler (app-name window-title x y w h)
  ;; set major mode
  (cond
    ((github-conversation-p window-title) (gfm-mode))
    ;; ...
    (t (markdown-mode)) ; default major mode
    ))
```
...or set the frame size and position to fit the bottom 400px of the window...
```elisp
(defun popup-handler (app-name window-title x y w h)
  (set-frame-position (selected-frame) x (+ y (- h 400)))
  (unless (zerop w)
    (set-frame-size (selected-frame) w 400 t))
  ;; ...
  )
```
...or configure automation settings
```elisp
(defun popup-handler (app-name window-title x y w h)
  (when (equal app-name "Terminal")
    ;; Tell Emacs Anywhere not to paste if launched from Terminal
    (setq ea-paste nil))
  ;; ...
  )
```

## Update
```
~/.emacs_anywhere/update
```

## Uninstall
```

~/.emacs_anywhere/uninstall
```

# Todo
- Windows

# Contributing
TBD

# License
MIT

Copyright © 2018, Zach Curry, All rights reserved.
