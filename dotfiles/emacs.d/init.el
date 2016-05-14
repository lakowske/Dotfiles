;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration
;; -------------------------------
;; -- Ensure packages installed --
;; -------------------------------
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; ---------------------
;; -- Global Settings --
;; ---------------------

(require 'package)
(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
(require 'smooth-scrolling)
(require 'whitespace)




(ido-mode t)
(menu-bar-mode -1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)
(setq x-super-keysym 'meta)

(setq uniquify-buffer-name-style 'reverse)

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

;; setup home and end to work correctly
(global-set-key [home] 'beginning-of-buffer)
(global-set-key "\M-p" 'beginning-of-buffer)

(global-set-key [end] 'end-of-buffer)
(global-set-key "\M-n" 'end-of-buffer)

;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;; ----------------------------
;; -- Original configuration --
;; ----------------------------

(setq user-email-address "lakowske@gmail.com")



;; backups are not necessary, CVS gets the job done, when the file is
;; important, the backup file is unwanted because it poses a
;; security risk or just clutters up the filesystem.
(setq make-backup-files nil)
(setq backup-inhibited t)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq tab-width 4)

;; turn column-number-mode on
(column-number-mode nil)

;; Get rid of the GUI-type stuff
;;(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Turn on snippets
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode t)
(setq yas-indent-line 'fixed)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
(define-key yas-minor-mode-map (kbd "\C-c TAB") 'yas-expand)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;; Whitespace configuration
(require 'whitespace)
(global-set-key "\C-c_w" 'whitespace-mode)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 120)

(add-hook 'sh-mode-hook 'whitespace-mode)
(add-hook 'sh-mode-hook (lambda () (global-linum-mode t)))
(add-to-list 'load-path "~/emacs/minor-modes")

;; Turn on projectile
(require 'projectile)
(projectile-global-mode)

;; Turn on git auto commit
(require 'git-auto-commit-mode)
(git-auto-commit-mode 1)
(setq-default gac-automatically-push-p t)

(defun my-after-save ()
  (if (and git-auto-commit-mode (not (string= "-" (projectile-project-name))))
    (gac-commit)
    (gac-push)
    (call-process-shell-command "git-push-and-build.sh" nil (get-buffer-create "docker-build"))
    ))


;;(defun my-build-hook ()
(add-hook 'after-save-hook 'my-after-save)

;; HTML configuration
(add-hook 'html-mode-hook 'auto-fill-mode)

;; Javascript configuration
;;(add-hook 'js2-mode-hook #'js2-refactor-mode)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))


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

(defun switch-to-previous-buffer ()
    "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
    (interactive)
    (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun start-nodejs-repl ()
  (interactive)
  (nodejs-repl)
  (other-window -1)
  )

(defun my-org-mode-config ()
  (setq org-agenda-files (list "/Users/home/notes/todo.org"
                               "~/org/home.org"))
  (local-set-key (kbd "C-c t") 'org-todo)
  (local-set-key (kbd "C-c a") 'org-agenda)
  )
  
(global-set-key (kbd "C-c C-\\") 'comment-region)
(global-set-key (kbd "C-c |") 'uncomment-region)
(global-set-key (kbd "\C-c\C-n") 'start-nodejs-repl)

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'js2-mode-hook 'my-js2-mode-config)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)
(add-hook 'org-mode-hook 'my-org-mode-config)

(defun node-on-buffer ()
  "pipes the current buffer to node"
  (interactive)
  (shell-command-on-region 
   (point-min) (point-max)
   (read-shell-command "Shell command on buffer: " "node")))

(defun java-on-buffer ()
  "pipes the current buffer to javac, then java"
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
   (read-shell-command "Shell command on buffer: " "javac | java")))
(global-set-key "\C-c\C-j" 'java-on-buffer)

;; Text mode configuration
(add-hook 'text-mode-hook 'auto-fill-mode)

;; Customizations for all of c-mode, c++-mode, and objc-mode
(defun seth-c-mode-common-hook ()
  ;; change the nasty default offset
  (c-set-offset 'substatement-open '0)
  ;; other customizations
  (setq tab-width 4) 
  (setq-default indent-tabs-mode true)
  ;; this will make sure spaces are used instead of tabs
  

  ;; set the default offset to 3
  (setq c-basic-offset 3)
  ;; keybindings for all supported languages.  We can put these in
  ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
  ;; java-mode-map, and idl-mode-map inherit from it.
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  
  )

;; add our function as the c-mode-common-hook
(add-hook 'c-mode-common-hook 'seth-c-mode-common-hook)
