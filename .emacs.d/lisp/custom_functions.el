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

;; Create a reasonable titlebar for emacs, which works on both windows
;; and unix. Assumes hostname is exported
(defun create_title_format (user host)
  "creates a window title string"
  (interactive)
  (list (getenv user) "@" (getenv host) ":"
        '(:eval
          (if buffer-file-name
              (replace-regexp-in-string
               (getenv "home")
               "~"
               (buffer-file-name))
            (buffer-name))))
  )


(defun copy-line (&optional arg)
  "do a kill-line but copy rather than kill.  this function directly calls
kill-line, so see documentation of kill-line for how to use it including prefix
argument and relevant variables.  this function works by temporarily making the
buffer read-only, so i suggest setting kill-read-only-ok to t."
  (interactive "p")
  (toggle-read-only 1)
  (kill-line arg)
  (toggle-read-only 0))


; word-count-region
; by Robert J. Chassell
(defun latex-word-count ()
  (interactive)
  (shell-command (concat "~/.emacs.d/packages/texcount.pl "
                         (buffer-file-name))))


(defun count-words-region (beginning end)
  "Print number of words in the region."
  (interactive "r")
  (message "Counting words in region ... ")
  (save-excursion
    (let ((count 0))
      (goto-char beginning)
      (while (and (< (point) end)
                  (re-search-forward "\\w+\\W*" end t))
        (setq count (1+ count)))
      (cond ((zerop count)
             (message
              "The region does NOT have any words."))
            ((= 1 count)
             (message
              "The region has 1 word."))
            (t
             (message
              "The region has %d words." count))))))

(defun count-words-buffer ()
  "Count all the words in the buffer"
  (interactive)
  (count-words-region (point-min) (point-max) )
  )
