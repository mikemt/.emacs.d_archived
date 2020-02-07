

(defvar moses-mode-map
  (let ((moses-mode-map (make-sparse-keymap)))
    (define-key moses-mode-map "\C-j" 'newline-and-indent)
    moses-mode-map)
  "Keymap for moses major mode")



(defvar wpdl-mode-syntax-table
  (let ((wpdl-mode-syntax-table (make-syntax-table)))



;; expose to the emacs environment
(provide 'moses-mode)