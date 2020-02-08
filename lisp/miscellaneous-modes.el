;; ----------------------------------------------------------------------
;; Miscellaneous Modes
;; ----------------------------------------------------------------------
(provide 'miscellaneous_modes)


;; Wikipedia mode
;; ----------------------------------------------------------------------
(autoload 'wikipedia-mode "wikipedia-mode.el"
"Major mode for editing documents in Wikipedia markup." t)

(add-to-list 'auto-mode-alist
             '("\\.wiki\\'" . wikipedia-mode))
(add-to-list 'auto-mode-alist
             '("en\\.wikipedia\\.org" . wikipedia-mode))
(add-to-list 'auto-mode-alist
             '("index.\\.*" . wikipedia-mode))


;; YAML mode
;; ----------------------------------------------------------------------
(require 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))


;; Dot Mode
;; ----------------------------------------------------------------------
(require 'graphviz-dot-mode)
