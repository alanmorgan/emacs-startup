;; Java mode setup

;; Common to C/C++ and Java
(add-hook 'java-mode-hook
          (lambda ()
            (gtags-mode 1)
            (setq indent-tabs-mode nil)
            (setq c-basic-offset 4)
            (c-set-offset 'inexpr-class 0)    ;; anonymous classes
            (when (equal "5.32.5" c-version)
              (c-set-offset 'annotation-var-cont 0))))

(add-to-list 'auto-mode-alist '("\\.java$" . java-mode))
