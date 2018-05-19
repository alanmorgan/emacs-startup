;; gtags - Uber studly tags mode
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-root-set nil)

;; gtags
(setq  gtags-mode-hook
        '(lambda ()
        (global-set-key [f1] 'gtags-find-tag)
        (global-set-key [S-f1] 'gtags-find-rtag)))
