
(setq completion-ignored-extensions (delete ".log" completion-ignored-extensions))
(setq compile-command nil)
(setq read-buffer-completion-ignore-case 't)
(setq line-move-visual nil) ;; ensure that next-line works the way vip.el wants
(put 'erase-buffer 'disabled nil)
(put 'eval-expression 'disabled nil)
(put 'save-buffers-kill-emacs 'disabled nil)
(set-language-environment 'latin-1)

(setq debug-on-error nil)

;;; KEYBINDINGS
(global-set-key [f2] 'dabbrev-expand)
(global-set-key [f3] '(lambda () "Refresh the current buffer"
                        (interactive)
                        (revert-buffer t (not (buffer-modified-p)) t)))
(global-set-key [f4] 'fill-paragraph)
(global-set-key [f5] 'split-window-horizontally)
(global-set-key [f6] 'switch-to-new-branch)
(global-set-key [f7] '(lambda () "Set read-only status on buffers that show read-only files"
                        (interactive)
                        (mapc (lambda (buffer) (adjust-buffer-read-only buffer (buffer-file-name buffer))) (buffer-list))))

(global-set-key [f10] 'hide-subtree)
(global-set-key [S-f10] 'show-subtree)

