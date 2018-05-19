(if (not (null window-system))
  (progn
    ;; see fonts with (w32-select-font)
    ;; (set-default-font "-outline-Courier New-normal-r-normal-normal-16-120-96-96-c-*-iso10646-1")
    ;; (set-default-font "-outline-Lucida Console-normal-r-normal-normal-16-120-96-96-c-*-iso10646-1")
    ;; (set-default-font font-name)
    
    ;; You can also specify the RGB in normal X fashion
    ;; #rrggbb
    (set-foreground-color "white")
    (set-background-color "darkslategrey")
    (set-mouse-color "green")
    (set-cursor-color "dodgerblue")
    (toggle-scroll-bar -1)
    
    (global-font-lock-mode 1)
    (copy-face 'default 'font-lock-comment-face) 
    (set-face-attribute 'font-lock-comment-face nil :foreground "pink")
    (copy-face 'default 'font-lock-doc-face) 
    (set-face-attribute 'font-lock-doc-face nil :foreground "pink")
    
    ;; preprocessor directives in C
    (set-face-attribute 'font-lock-builtin-face nil :foreground "yellow")
    ;; (set-face-attribute 'font-lock-string-face nil :foreground "blue")
    
    ;; (copy-face 'default 'font-lock-fish-face) 
    ;; (set-face-attribute 'font-lock-fish-face nil :foreground "red")
    ;; (font-lock-add-keywords 'c-mode '(("\\<\\(FISH\\)" . font-lock-fish-face)))
    
    (copy-face 'default 'font-lock-keyword-face)
    (copy-face 'default 'font-lock-string-face)
    ;; (copy-face 'default 'font-lock-builtin-face)
    (copy-face 'default 'font-lock-function-name-face)
    (copy-face 'default 'font-lock-variable-name-face)
    (copy-face 'default 'font-lock-type-face)
    (copy-face 'default 'font-lock-constant-face)
    (copy-face 'default 'font-lock-warning-face)
    ;; (copy-face 'default 'font-lock-module-def-face)
    ;; (copy-face 'default 'font-lock-interface-def-face)
    
    ;; (global-set-key [f10] (function (lambda () (interactive) (message (concat (int-to-string (frame-width)) " x " (int-to-string (frame-height)))))))
    ))

(tool-bar-mode -1)
(display-time)

