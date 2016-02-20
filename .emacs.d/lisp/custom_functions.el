;; ----------------------------------------------------------------------
;; Functions
;; ----------------------------------------------------------------------
(provide 'custom_functions)

(defun system-is-linux ()
  (interactive)
    (string-equal system-type "gnu/linux"))

(defun system-is-darwin ()
  (interactive)
    (string-equal system-type "darwin"))

(defun system-is-windows ()
  (interactive)
    (string-equal system-type "windows-nt"))

;; unfill a paragraph, i.e., make it so the text does not wrap in the
;; paragraph where the cursor is
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

;; unfill a region, i.e., make is so the text in that region does not
;; wrap
(defun unfill-region ()
  (interactive)
  (let ((fill-column (point-max)))
        (fill-region (region-beginning) (region-end) nil)))


(defun set-no-process-query-on-exit ()
  (let ((proc (get-buffer-process (current-buffer))))
    (when (processp proc)
            (set-process-query-on-exit-flag proc nil))))
