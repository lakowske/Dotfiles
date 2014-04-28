;; Contains functions useful for working with javascript
(defun add-it-up (x y) 
  (if (> x 2)
      (+ x y)
    x))

(defun only-js (dir predicate)
  (delq nil
	(mapcar predicate (directory-files dir)))
  )

(defun js-pred (file)
  (if (eq (string-match "\\.js$" file) nil)
      nil
    file))

;; Tests
(only-js "/Volumes/home/composite/src/UI" (lambda (x) (js-pred x)))
(add-it-up 3 3)
(js-pred "test.js")
