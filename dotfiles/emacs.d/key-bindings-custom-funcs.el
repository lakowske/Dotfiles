
;; ------------
;; -- Macros --
;; ------------
(fset 'align-equals "\C-[xalign-regex\C-m=\C-m")
(global-set-key "\M-=" 'align-equals)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-x\C-d" 'dired)
(global-set-key "\C-x\C-r" 'query-replace)
(global-set-key "\C-x\C-i" 'indent-region)
(global-set-key (kbd "C-x /") 'comment-or-uncomment-region)
(global-set-key "\C-c\C-f" 'find-grep)
(global-set-key [f5] 'switch-to-previous-buffer)
(global-set-key [f6] 'back-frame)

(defun back-frame ()
  (interactive)
  (other-frame 1)
  )

;; magit is great!
(global-set-key (kbd "C-x g") 'magit-status)

;; setup home and end to work correctly
(global-set-key [home] 'beginning-of-buffer)
(global-set-key "\M-p" 'beginning-of-buffer)

(global-set-key [end] 'end-of-buffer)
(global-set-key "\M-n" 'end-of-buffer)

(setq user-email-address "lakowske@gmail.com")



;; -------------------------
;; Copy to clipboard
;; -------------------------
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))


(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; uuid insertion into current buffer
(defun uuid ()
  (interactive)
  (insert (shell-command-to-string "uuid"))
  )

(defun date ()
  (interactive)
  (insert (shell-command-to-string "date \"+%Y-%m-%d\""))
  )


(defun open-ansi-shell ()
  (interactive)
  (ansi-term "/usr/local/bin/bash"))

(global-set-key (kbd "C-c s") 'open-ansi-shell)

;; TODO: Come up with a better solution.
;; The remote repo would not be available and hang on push
(defun my-after-save ()
  (if (and (not (string= "-" (projectile-project-name))) (string-match "/Users/home/notes" (projectile-project-root)))
      (progn
        (gac-commit)
        (shell-command "git push")
        ;;(gac-push)
        (message "pushed commit")
        (if (or (string= "flax-services" (projectile-project-name)) (string= "Blog" (projectile-project-name)))
            (progn
              (message "building flax services")
              (call-process-shell-command "build-flax-services.sh" nil (get-buffer-create "docker-build")))
          )
    )))

;;(defun my-build-hook ()
;; (add-hook 'after-save-hook 'my-after-save)

;; HTML configuration
(add-hook 'html-mode-hook 'auto-fill-mode)

;; Yaml configuration
(add-hook 'yaml-mode-hook (lambda () (auto-fill-mode -1)))
