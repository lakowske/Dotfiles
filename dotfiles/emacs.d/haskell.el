;; haskell

;; (add-hook 'haskell-mode-hook 'intero-mode)
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))


(defun haskell-mode-setup ()
  ;; (setq haskell-process-type 'stack-ghci)
  (setq haskell-process-log t)
  )

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-mode-setup)
(custom-set-variables '(haskell-tags-on-save t))

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(haskell-doc-chop-off-context t)
;;  '(haskell-doc-show-global-types t)
;;  '(haskell-doc-use-inf-haskell t)
;;  '(haskell-process-auto-import-loaded-modules t)
;;  '(haskell-process-log t)
;;  '(haskell-process-suggest-remove-import-lines t)
;;  '(haskell-process-suggest-hoogle-imports t)
;;  '(haskell-process-auto-import-loaded-modules t)
;;  '(haskell-process-type (quote cabal-repl))
;;  '(package-selected-packages
;;    (quote
;;     (ghc flymake-go go-playground go-mode yaml-mode tern-auto-complete smooth-scrolling shakespeare-mode python-mode pcap-mode nodejs-repl magit js2-refactor intero helm-projectile groovy-mode git-auto-commit-mode flx-ido ess elm-mode ein csv-mode cider better-defaults)))
;;  '(safe-local-variable-values
;;    (quote
;;     ((haskell-process-use-ghci . t)
;;      (haskell-indent-spaces . 4)))))
;; (eval-after-load 'haskell-mode '(progn
;;                                   (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
;;                                   (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
;;                                   (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
;;                                   (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
;;                                   (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
;;                                   (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)))
;; (eval-after-load 'haskell-cabal '(progn
;;                                    (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
;;                                    (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;;                                    (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;;                                    (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))




(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-y") 'ghc-show-type))

(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))

(setq ghc-report-errors nil)

