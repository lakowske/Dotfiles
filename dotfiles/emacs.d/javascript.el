;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;; Javascript configuration
;;(add-hook 'js2-mode-hook #'js2-refactor-mode)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;; Send region to nodejs repl
(defun send-region-to-nodejs-repl-process (start end)
  "Send region to `nodejs-repl' process."
  (interactive "r")
  (save-selected-window
    (save-excursion (nodejs-repl)))
  (comint-send-region (get-process nodejs-repl-process-name)
                      start end))

 (defun send-buffer-to-nodejs-repl-process ()
   "Send buffer to `nodejs-repl' process."
   (interactive)
   (comint-send-region (get-process nodejs-repl-process-name) (point-min) (point-max)))


(defun my-js2-mode-config ()
  (local-set-key (kbd "C-c C-e") 'send-region-to-nodejs-repl-process)
  (local-set-key (kbd "C-c C-b") 'send-buffer-to-nodejs-repl-process)
  (local-set-key (kbd "C-c C-u") 'js2-mode-toggle-element)
  (js2-imenu-extras-mode)
  )

(defun start-nodejs-repl ()
  (interactive)
  (nodejs-repl)
  (other-window -1)
  )

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'js2-mode-hook 'my-js2-mode-config)

(defun node-on-buffer ()
  "pipes the current buffer to node"
  (interactive)
  (shell-command-on-region 
   (point-min) (point-max)
   (read-shell-command "Shell command on buffer: " "node")))
