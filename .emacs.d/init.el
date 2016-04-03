;; ---------------------------------------------------------------------- 
;; Preliminaries
;; ---------------------------------------------------------------------- 
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/packages/")

(require 'custom_functions)
(require 'server)

(if (system-is-windows)
    (server-start))

;; ---------------------------------------------------------------------- 
;; Packages
;; ---------------------------------------------------------------------- 

(require 'linum)

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

(if (display-graphic-p)
    ;;(load-theme 'alect-dark t)
;;    (load-theme 'sanityinc-tomorrow-day t)
;;    (load-theme 'sanityinc-tomorrow-night t)
  ;; (load-theme 'zenburn t)
    (load-theme 'ample-zen t)
    ;;(require 'solarized-light-theme)
    ;;(require 'tangotango-theme)
    ;;(load-theme 'wombat t)
(progn
    (load-theme 'wombat t))
)

(add-to-list 'default-frame-alist '(font . "Monaco 11"))
(set-face-attribute 'default t :font "Monaco 11")






