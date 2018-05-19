;; Makefiles
(add-hook 'makefile-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (when window-system
              (copy-face 'default 'makefile-space-face))))


(add-to-list 'auto-mode-alist '("^\[Mm\]akefile$" . makefile-mode))
