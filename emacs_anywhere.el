(require 'f)

(defun ea-on-delete (frame)
  (clipboard-kill-ring-save
   (point-min)
   (point-max))
  (kill-buffer "*Emacs Anywhere*"))

(defun ea-on-delete2 (frame)
  (f-write (buffer-string) 'utf-8 "/home/sibi/.emacs_anywhere/clipboard"))

(defun ea-hook ()
  (add-hook 'delete-frame-functions 'ea-on-delete2))

(defun ea-unhook ()
  (remove-hook 'delete-frame-functions 'ea-on-delete2))

(defun emacs-anywhere ()
  (interactive)
  (if (y-or-n-p "On delete-frame copy current-buffer to clipboard and kill *Emacs Anywhere*? ")
      (ea-hook)
    (ea-unhook)))

(ea-hook)
(switch-to-buffer "*Emacs Anywhere*")
(select-frame-set-input-focus (selected-frame))
