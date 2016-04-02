;; ----------------------------------------------------------------------
;; org mode
;; ----------------------------------------------------------------------
(provide 'orgmode_settings)

(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;(autoload 'org-mode "org" "org mode" t)
;;(autoload 'orgstruct-mode "org" "org structure as a minor mode." t)

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(setq reftex-default-bibliography
      (quote
       ("~/projects/bibliography.bib")))
(setq org-src-fontify-natively t)
