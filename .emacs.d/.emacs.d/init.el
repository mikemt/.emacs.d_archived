;; ---------------------------------------------------------------------- 
;; Preliminaries
;; ---------------------------------------------------------------------- 
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/packages/")

;; ---------------------------------------------------------------------- 
;; Packages
;; ---------------------------------------------------------------------- 

(require 'ido)
(ido-mode t)

(require 'linum)

;; ---------------------------------------------------------------------- 
;; Settings
;; ---------------------------------------------------------------------- 

(require 'custom_functions)
(require 'general-settings)
(require 'yasnippet_settings)
(require 'orgmode_settings)
(require 'python_settings)
;;(require 'auto-complete_settings)


;;(require 'tex_settings)
;;(require 'matlab_settings)
(require 'wikipedia_settings)

;; ---------------------------------------------------------------------- 
;; Appearance customizations
;; ---------------------------------------------------------------------- 

(if
    (equal 0 (string-match "^24" emacs-version))
    ;;(require 'solarized-light-theme)
  (require 'tangotango-theme)
  (progn
    (require 'color-theme)
    (color-theme-initialize)
    (require 'color-theme-solarized)
    (color-theme-solarized-dark))
  )
(setq solarized-termcolors 256)

;;(require 'faces)
;;(if (system-is-darwin)
;;(set-face-attribute 'default nil
 ;;                   :family "Inconsolata" :height 120 :weight 'normal);;    (set-face-attribute 'default nil
;;)

