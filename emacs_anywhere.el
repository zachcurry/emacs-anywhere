(defvar ea-on)

(defun ea-osx-on-delete ()
  (clipboard-kill-ring-save
   (point-min)
   (point-max)))

(defun ea-linux-on-delete ()
  (write-region nil nil "/tmp/eaclipboard")
  (shell-command "xclip -selection clipboard /tmp/eaclipboard &> /dev/null"))

(defun ea-on-delete (frame)
  (when ea-on
    (cond
     ((string-equal system-type "darwin") (ea-osx-on-delete))
     ((string-equal system-type "gnu/linux") (ea-linux-on-delete)))
    (kill-buffer "*Emacs Anywhere*"))
  (shell-command
   (format "echo export EA_ABORT=%s > /tmp/eaenv"
           (if ea-on "false" "true"))))

(defun toggle-ea ()
  (interactive)
  (setq ea-on (not ea-on))
  (message
   "Emacs Anywhere: %s"
   (if ea-on "on" "off")))

(defun ea-init ()
  (setq ea-on t)
  (add-hook 'delete-frame-functions 'ea-on-delete)
  (switch-to-buffer "*Emacs Anywhere*")
  (select-frame-set-input-focus (selected-frame)))

(ea-init)
