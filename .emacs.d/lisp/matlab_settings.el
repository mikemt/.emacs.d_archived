;; ----------------------------------------------------------------------
;; Matlab Settings
;; ----------------------------------------------------------------------
(provide 'matlab_settings)

(defun my-matlab-mode-hook ()
  (setq fill-column 76) 
  (imenu-add-to-menubar "Find")); where auto-fill should wrap

(add-to-list 'load-path "~/matlab")

(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)

(setq matlab-indent-function t); if you want function bodies indented
(setq matlab-verify-on-save-flag nil); turn off auto-verify on save
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
