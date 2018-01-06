(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)
(setq x-super-keysym 'meta)
(setq uniquify-buffer-name-style 'reverse)
;; backups are not necessary, CVS gets the job done, when the file is
;; important, the backup file is unwanted because it poses a
;; security risk or just clutters up the filesystem.
(setq make-backup-files nil)
(setq backup-inhibited t)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq tab-width 4)

;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

;; turn column-number-mode on
(column-number-mode nil)

;; Get rid of the GUI-type stuff
;;(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Turn off tabs for indent
(setq-default indent-tabs-mode nil)

(menu-bar-mode -1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(add-to-list 'auto-mode-alist '("Jenkinsfile" . groovy-mode))

(git-auto-commit-mode)
