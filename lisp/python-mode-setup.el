;; Python
(add-hook 'python-mode-hook
          (lambda ()))

(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'auto-mode-alist '("\\.scons$" . python-mode))
(add-to-list 'auto-mode-alist '("^SConstruct$" . python-mode))
