;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------------

(add-to-list 'load-path "~/.emacs.d")
(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
(require 'smooth-scrolling)
(require 'whitespace)
(require 'dired-x)
(require 'compile)
(ido-mode t)
(menu-bar-mode -1)
;;(normal-erase-is-backspace-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit autoface-default :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "monaco"))))
 '(column-marker-1 ((t (:background "red"))))
 '(diff-added ((t (:foreground "cyan"))))
 '(flymake-errline ((((class color) (background light)) (:background "Red"))))
 '(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "red"))))
 '(fundamental-mode-default ((t (:inherit default))))
 '(highlight ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(isearch ((((class color) (min-colors 8)) (:background "yellow" :foreground "black"))))
 '(linum ((t (:foreground "black" :weight bold))))
 '(region ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(secondary-selection ((((class color) (min-colors 8)) (:background "gray" :foreground "cyan"))))
 '(show-paren-match ((((class color) (background light)) (:background "black"))))
 '(vertical-border ((t nil)))
)

;; ------------
;; -- Macros --
;; ------------
(load "defuns-config.el")
(fset 'align-equals "\C-[xalign-regex\C-m=\C-m")
(global-set-key "\M-=" 'align-equals)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c;" 'comment-or-uncomment-region)
(global-set-key "\M-n" 'next5)
(global-set-key "\M-p" 'prev5)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-i" 'back-window)
(global-set-key "\C-z" 'zap-to-char)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-d" 'delete-word)
(global-set-key "\M-h" 'backward-delete-word)
(global-set-key "\M-u" 'zap-to-char)
(global-set-key "\C-x\C-d" 'dired)
(global-set-key "\C-x\C-r" 'query-replace)
(global-set-key "\C-x\C-i" 'indent-region)
(global-set-key (kbd "C-x /") 'comment-or-uncomment-region)

;; setup home and end to work correctly
(global-set-key [home] 'beginning-of-buffer)
(global-set-key "\M-p" 'beginning-of-buffer)

(global-set-key [end] 'end-of-buffer)
(global-set-key "\M-n" 'end-of-buffer)


(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/jade-mode") ;; github.com/brianc/jade-mode
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0")

;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
;;(load "js-config.el")
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))



;; ----------------------------
;; -- Original configuration --
;; ----------------------------

(setq user-email-address "lakowske@gmail.com")

;; backups are not necessary, CVS gets the job done, when the file is
;; important, the backup file is unwanted because it poses as a
;; security risk or just clutters up my filesystem.
(setq make-backup-files nil)
(setq backup-inhibited t)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq tab-width 4) 


;;(global-set-key "\C-h" 'delete-backward-char)
;;(global-set-key "C-#" 'goto-line)

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

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")




;;(add-to-list 'load-path "~/.emacs.d/plugin/jshint-mode")
;;(require 'flymake-jshint)

;; Whitespace configuration
(require 'whitespace)
(global-set-key "\C-c_w" 'whitespace-mode)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 120)

(add-hook 'js-mode-hook 'whitespace-mode)
(add-hook 'js-mode-hook (lambda () (flymake-mode t)))
(add-hook 'js-mode-hook (lambda () (setq indent-tabs-mode nil)))
(add-hook 'js-mode-hook (lambda () (global-linum-mode t)))

(add-hook 'sh-mode-hook 'whitespace-mode)
(add-hook 'sh-mode-hook (lambda () (global-linum-mode t)))
(add-to-list 'load-path "~/emacs/minor-modes")
;; Nice Flymake minibuffer messages
(require 'flymake-cursor)

;; Turns on flymake for all files which have a flymake mode
;;(add-hook 'find-file-hook 'flymake-find-file-hook)



;;(autoload 'js2-mode "js2" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-to-list 'load-path "~/.emacs.d/js-comint.el")
(require 'js-comint)
(setq inferior-js-program-command "node")
(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list 'comint-preoutput-filter-functions
                     (lambda (output)
                       (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
                     (replace-regexp-in-string ".*1G.*3G" "&gt;" output))))))
(global-set-key "\C-c\C-e" 'js-send-region)
(global-set-key "\C-c\C-b" 'js-send-buffer)

(defun node-on-buffer ()
  "pipes the current buffer to node"
  (interactive)
  (shell-command-on-region 
   (point-min) (point-max)
   (read-shell-command "Shell command on buffer: " "node")))
(global-set-key "\C-c\C-n" 'node-on-buffer)

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
