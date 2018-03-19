(defvar ea-on t)
(defvar ea-paste t)

(defconst ea--buffer-name "*Emacs Anywhere*")

(defconst ea--osx (string-equal system-type "darwin"))
(defconst ea--gnu-linux (string-equal system-type "gnu/linux"))

(defun toggle-ea ()
  (interactive)
  (setq ea-on (not ea-on))
  (message
   "Emacs Anywhere: %s"
   (if ea-on "on" "off")))

(defun ea--osx-copy-to-clip ()
  (clipboard-kill-ring-save
   (point-min)
   (point-max)))

(defun ea--gnu-linux-copy-to-clip ()
  (write-region nil nil "/tmp/eaclipboard"))

(defun ea--delete-frame-handler (_frame)
  (remove-hook 'delete-frame-functions 'ea--delete-frame-handler)
  (when ea-on
    (cond
     (ea--osx (ea--osx-copy-to-clip))
     (ea--gnu-linux (ea--gnu-linux-copy-to-clip)))
    (kill-buffer ea--buffer-name))
  (shell-command
   (format "echo export EA_ABORT=%s; export EA_SHOULD_PASTE=%s > /tmp/eaenv"
           (if ea-on "false" "true")
           (if ea-paste "true" "false"))))

(defun ea--init ()
  (set ea-on t) ; begin each session with EA enabled
  (set ea-paste t) ; begin each session with paste enabled
  (add-hook 'delete-frame-functions 'ea--delete-frame-handler)
  (switch-to-buffer ea--buffer-name)
  (select-frame-set-input-focus (selected-frame))
  ;; run hook if defined
  (when (boundp 'ea-popup-hook)
    (run-hook-with-args 'ea-popup-hook
                        ea-app-name
                        ea-window-title
                        ea-x
                        ea-y
                        ea-width
                        ea-height)))

(ea--init)

(defun popup-handler (app-name window-title x y width height)
  (set-frame-position (selected-frame) x y)
  (unless (zerop width)
    (set-frame-size (selected-frame) width 400))
  (cond
   ((equal s "Google Chome") (markdown-mode))
   (t nil)))
