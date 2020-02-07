;; ----------------------------------------------------------------------
;; Wikipedia mode
;; ----------------------------------------------------------------------
(provide 'wikipedia_settings)

(autoload 'wikipedia-mode "wikipedia-mode.el"
"Major mode for editing documents in Wikipedia markup." t)

(add-to-list 'auto-mode-alist
'("\\.wiki\\'" . wikipedia-mode))

; To load with view source from within firefox 3.x
(add-to-list 'auto-mode-alist
'("en\\.wikipedia\\.org" . wikipedia-mode))
(add-to-list 'auto-mode-alist '("index.\\.*" . wikipedia-mode))

