(defun java-on-buffer ()
  "pipes the current buffer to javac, then java"
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
   (read-shell-command "Shell command on buffer: " "javac | java")))
(global-set-key "\C-c\C-j" 'java-on-buffer)

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
