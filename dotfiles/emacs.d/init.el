
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)
(setq warning-suppress-log-types '((package reinitialization)))

;; Use tcp so we can run multiple daemons and swap between them with
;; the --server-file option at the CLI
(setq server-use-tcp t)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;(load "~/.emacs.d/config.el")
;;(load "~/.emacs.d/key-bindings-custom-funcs.el")
;;(load "~/.emacs.d/init.el.orig")
;;(load "~/.emacs.d/c-java.el")
;;(load "~/.emacs.d/javascript.el")
;;(load "~/.emacs.d/haskell.el")
