(defvar ea-popup-hook nil
  "Functions run after entering Emacs Anywhere session.
Functions are run with args APP-NAME WINDOW-TITLE X Y WIDTH HEIGHT")

(defvar ea-on t)
(defvar ea-copy t)
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
  (when (and ea-on ea-copy (get-buffer ea--buffer-name))
    (switch-to-buffer ea--buffer-name)
    (cond
     (ea--osx (ea--osx-copy-to-clip))
     (ea--gnu-linux (ea--gnu-linux-copy-to-clip))))
  (when ea-on (kill-buffer ea--buffer-name))
  (shell-command
   (format (concat "echo export EA_ABORT=%s\";\""
                   "export EA_SHOULD_COPY=%s\";\""
                   "export EA_SHOULD_PASTE=%s"
                   " > /tmp/eaenv")
           (if ea-on "false" "true")
           (if ea-copy "true" "false")
           (if ea-paste "true" "false"))))

(defun ea--init ()
  (setq ea-on t) ; begin each session with EA enabled
  (setq ea-copy t) ; begin each session with copy enabled
  (setq ea-paste t) ; begin each session with paste enabled
  (add-hook 'delete-frame-functions 'ea--delete-frame-handler)
  (switch-to-buffer ea--buffer-name)
  (select-frame-set-input-focus (selected-frame))
  (run-hook-with-args 'ea-popup-hook
                      ea-app-name
                      ea-window-title
                      ea-x
                      ea-y
                      ea-width
                      ea-height))

(ea--init)
