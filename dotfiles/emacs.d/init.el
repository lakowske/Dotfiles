;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration
;; -------------------------------
;; -- Ensure packages installed --
;; -------------------------------

;; Use tcp so we can run multiple daemons and swap between them with
;; the --server-file option at the CLI
(setq server-use-tcp t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
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
(require 'whitespace)
(require 'company)


(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

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

;; magit is great!
(global-set-key (kbd "C-x g") 'magit-status)


;; setup home and end to work correctly
(global-set-key [home] 'beginning-of-buffer)
(global-set-key "\M-p" 'beginning-of-buffer)

(global-set-key [end] 'end-of-buffer)
(global-set-key "\M-n" 'end-of-buffer)


;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
(add-to-list 'auto-mode-alist '("Jenkinsfile" . groovy-mode))

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

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

(global-set-key (kbd "C-c s") 'open-ansi-shell)

;; company mode
(add-to-list 'company-backends 'company-ghc)
(add-hook 'after-init-hook 'global-company-mode)

(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))


;;elm
(require 'elm-mode)

;; purescript
(require 'flycheck)
(require 'purescript-mode)
(require 'psc-ide)

(add-hook 'purescript-mode-hook
  (lambda ()
    (psc-ide-mode)
    (company-mode)
    (flycheck-mode)
    (turn-on-purescript-indentation)))

(setq psc-ide-use-npm-bin t)

;;haskell

;; (add-hook 'haskell-mode-hook 'intero-mode)
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))


(defun haskell-mode-setup ()
  (setq haskell-process-type 'stack-ghci)
  (setq haskell-process-log t)
  )

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-mode-setup)
(custom-set-variables '(haskell-tags-on-save t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-doc-chop-off-context t)
 '(haskell-doc-show-global-types t)
 '(haskell-doc-use-inf-haskell t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-suggest-hoogle-imports t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-type (quote cabal-repl))
 '(package-selected-packages
   (quote
    (ghc flymake-go go-playground go-mode yaml-mode tern-auto-complete smooth-scrolling shakespeare-mode python-mode pcap-mode nodejs-repl magit js2-refactor intero helm-projectile groovy-mode git-auto-commit-mode flx-ido ess elm-mode ein csv-mode cider better-defaults)))
 '(safe-local-variable-values
   (quote
    ((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4)))))
(eval-after-load 'haskell-mode '(progn
                                  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
                                  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
                                  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
                                  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
                                  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
                                  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)))
(eval-after-load 'haskell-cabal '(progn
                                   (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
                                   (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
                                   (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
                                   (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))




(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-y") 'ghc-show-type))

(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))

(setq ghc-report-errors nil)

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

;; Turn off tabs for indent
(setq-default indent-tabs-mode nil)

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
;;(git-auto-commit-mode 1)
;;(setq-default gac-automatically-push-p t)
(git-auto-commit-mode)
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
(add-hook 'after-save-hook 'my-after-save)

;; HTML configuration
(add-hook 'html-mode-hook 'auto-fill-mode)

;; Yaml configuration
(add-hook 'yaml-mode-hook (lambda () (auto-fill-mode -1)))

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

(setq magit-last-seen-setup-instructions "1.4.0")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
