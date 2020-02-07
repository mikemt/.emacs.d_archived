;; ----------------------------------------------------------------------
;; org mode
;; ----------------------------------------------------------------------
(provide 'orgmode_settings)


(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

(require 'org-ref)
(setq reftex-default-bibliography '("~/OneDrive/collection/mtmt.bib"))
(setq org-ref-bibliography-notes "~/OneDrive/collection/notes.org"
      org-ref-default-bibliography '("~/OneDrive/collection/mtmt.bib")
      org-ref-pdf-directory "~/OneDrive/collection/a_citeulike/")

(setq bibtex-completion-pdf-open-function
  (lambda (fpath)
    (start-process "open" "*open*" "open" fpath)))

(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
	"bibtex %b"
	"pdflatex -interaction nonstopmode -output-directory %o %f"
	"pdflatex -interaction nonstopmode -output-directory %o %f"))


(setq org-ref-completion-library 'org-ref-helm-bibtex)
(org-ref-cancel-link-messages)
(setq org-latex-prefer-user-labels t)

(global-set-key "\C-cr" 'org-ref-helm-insert-ref-link)

(setq org-latex-default-packages-alist
      (-remove-item
       '("" "hyperref" nil)
       org-latex-default-packages-alist))

;; Append new packages
(add-to-list 'org-latex-default-packages-alist '("numbers" "natbib" "") t)
(add-to-list 'org-latex-default-packages-alist
             '("linktocpage,colorlinks=true,
                linkcolor=blue,anchorcolor=blue,
                citecolor=red,filecolor=red,menucolor=red,urlcolor=blue"
               "hyperref" nil) t)

;;(autoload 'org-mode "org" "org mode" t)
;;(autoload 'orgstruct-mode "org" "org structure as a minor mode." t)

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(setq org-src-fontify-natively t)

;; additional org mode template expansions
(add-to-list 'org-structure-template-alist '("ca" "#+CAPTION: "))
(add-to-list 'org-structure-template-alist '("la" "#+LABEL: "))
(add-to-list 'org-structure-template-alist '("lf" "#+LABEL: fig:"))
(add-to-list 'org-structure-template-alist '("bibstyle" "bibliographystyle:plainnat"))
(add-to-list 'org-structure-template-alist '("bib" "bibliography:~/OneDrive/collection/mtmt.bib"))

;; Fixing windmove to work with orgmode
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; yas TAB exapnd to work with orgmode
(defun yas/org-very-safe-expand ()
            (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)))

;; org mode key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cr" 'org-ref-helm-insert-ref-link)




