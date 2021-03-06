(defun kill-matching-buffers (string-to-match)
  (interactive "sString to match: ")
  (mapc (lambda (b) (let ((file-name (buffer-file-name b)))
                      (when (and (not (null file-name))
                                 (string-match string-to-match file-name))
                        (kill-buffer b)))) (buffer-list)))
