;; ----------------------------------------------------------------------
;; LaTeX/Tex/AucTeX Settings
;; ----------------------------------------------------------------------
(provide 'tex_settings)

(use-package tex-site
  :defer t
  :ensure auctex
  :config
  (setq TeX-parse-self t)
  (setq TeX-master nil)
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-PDF-mode t))

;(load "tex-site")
;(load "tex-mik")

;(load "preview-latex.el" nil t t)
;(setq preview-image-type 'pnm)

;; --------------------------------------------------------------------------
;; RefTeX mode 
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make Citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase Mode" t)


;; Custom key bindings
(define-key global-map [f5] 'do-LaTeX) ; LaTeX
;; (define-key global-map [f6] 'TeX-next-error) ; goto next found - LaTeX error
(define-key global-map [f7] 'do-BiBTeX) ; BiBTeX
(define-key global-map [f8] 'do-View) ; View the dvi file
(define-key global-map [f9] 'do-dvi2ps) ; dvi2ps the file

(defun do-LaTeX ()
  "LaTeX the current master file"
  (interactive)
  (beginning-of-line)
  (TeX-command "LaTeX" 'TeX-master-file)
)

(defun do-BiBTeX ()
  "BibTeX the current master file"
  (interactive)
  (beginning-of-line)
  (TeX-command "BibTeX" 'TeX-master-file)
)

(defun do-View ()
  "View the current file"
  (interactive)
  (beginning-of-line)
  (TeX-command "View" 'TeX-master-file)
)

(defun do-dvi2ps ()
  "dvi2ps the current file"
  (interactive)
  (beginning-of-line)
  (TeX-command "File" 'TeX-master-file)
)





