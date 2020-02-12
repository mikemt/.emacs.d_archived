;; ---------------------------------------------------------------------- 
;; Preliminaries
;; ---------------------------------------------------------------------- 
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/packages/")

(eval-when-compile
  (require 'use-package))

(require 'custom_functions)
(require 'server)

(if (system-is-windows)
    (server-start))

(when (system-is-darwin)
    (add-to-list 'load-path "/opt/local/bin/")
)

;; ---------------------------------------------------------------------- 
;; Settings
;; ---------------------------------------------------------------------- 

(require 'ido-settings)
(require 'general-settings)
(require 'yasnippet_settings)
(require 'autocomplete_settings)
(require 'orgmode_settings)
(require 'python_settings)
;;(require 'c_settings)
(require 'tex_settings)
;;(require 'matlab_settings)

;;(require 'wikipedia_settings)
;;(require 'moses-mode)

;; ---------------------------------------------------------------------- 
;; Appearance customizations
;; ---------------------------------------------------------------------- 

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(if (display-graphic-p)
    (use-package material-theme
      :ensure t
      :config
      (load-theme 'material t))
  (progn
    (use-package wombat
      :ensure t
      :config
      (load-theme 'wombat t))
))

(when (system-is-darwin)
   (add-to-list 'default-frame-alist '(font . "Monaco 11"))
   (set-face-attribute 'default t :font "Monaco 11")
)

(put 'downcase-region 'disabled nil)











(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (tex-site auctex yasnippet which-key use-package org-ref material-theme jedi ido-vertical-mode ein cython-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
