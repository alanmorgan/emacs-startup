;; Setup for C and C++
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            
            (setq c-basic-offset 2)
            ;; c-read-offset to read
            (c-set-offset 'statement 0)
            (c-set-offset 'statement-block-intro '+)
            (c-set-offset 'substatement-open 0)
            (c-set-offset 'statement-cont 'c-lineup-math)
            (c-set-offset 'block-open '-)
            (c-set-offset 'case-label '+)
            (c-set-offset 'label 0)
            (c-set-offset 'brace-list-open 0)
            (c-set-offset 'inline-open 0)
            (c-set-offset 'arglist-cont '-)
            (c-set-offset 'arglist-intro '+)
            
            (setq c-hanging-comment-ender-p nil)
            
            (gtags-mode 1)
            (outline-minor-mode)))

;; This should only be done when we are in c-mode
(defun which-c-func ()
  "Prints out the name of the C function which we are inside.  This
has been improved to work with K&R style functions in the unhappy
event that you are forced to deal with them.  It will *not* deal
with K&R functions that have parameters that have parens in them."
  (interactive)
  (when (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (save-excursion
        (search-backward "\n{")
        (search-backward ")")   ; Skip over intervening garbage
        (forward-char 1)
        (backward-sexp)
        (let ((endofname (point)))
          (forward-word -1)
          (message "Function name: %s" (buffer-substring (point) endofname))))))

;; Ditto
(defun beginning-c-func ()
  (interactive)
  (when (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
    (progn
      (search-backward "\n{")
      (forward-char 1))))

;; Moves up to the enclosing curly brace.  Correctly handles:
;;
;; foo()
;; { // <-- You'll move to here
;;
;;   if (foo) {  // <-- ...not to here
;;      ... }
;;   while (bar) {  // <-- ...or to here
;;    if(b){...}else{...} ....
;;    }
;;   .... 
;;   x = y; // <-- ...if you start from here
;; }  

(add-to-list 'auto-mode-alist '("\\.c$" . c-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c-mode))
(add-to-list 'auto-mode-alist '("\\.fw$" . c-mode))
(add-to-list 'auto-mode-alist '("\\.cc$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hh$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.C$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cxx$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.y$" . c-mode))

