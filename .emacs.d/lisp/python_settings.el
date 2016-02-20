;; ----------------------------------------------------------------------
;; Python Settings
;; ----------------------------------------------------------------------
(provide 'python_settings)

;;(setenv
 ;"PATH" (concat
 ;        "$HOME/.bin:"
  ;       "/usr/bin:"
  ;       "/sbin:"
  ;       "/usr/sbin:"
  ;       "/usr/local/bin:"
  ;       "/opt/local/bin:"
  ;       "/usr/local/sbin"))

;;(setenv "PYTHONPATH" "/opt/usr/local/lib/python2.7/site-packages:")

;; Elpy 
(package-initialize)
(elpy-enable)
(setq elpy-rpc-backend "jedi")   ;; backend from ropes to jedi
;;(elpy-use-ipython)
(custom-set-faces
 '(highlight-indentation-current-column-face ((t nil))))


;; Cython mode
;;(require 'cython-mode)
;;(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))
;;(add-to-list 'auto-mode-alist '("\\.pxd\\'" . cython-mode))
;;(add-to-list 'auto-mode-alist '("\\.pxi\\'" . cython-mode))
