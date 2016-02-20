;; ---------------------------------------------------------------------- 
;; Preliminaries
;; ---------------------------------------------------------------------- 
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/packages/")

(add-hook 'term-exec-hook 'set-no-process-query-on-exit)

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
;;(require 'yasnippet_settings)
(require 'orgmode_settings)
(require 'python_settings)
;;(require 'auto-complete_settings)


;;(require 'tex_settings)
;;(require 'matlab_settings)
(require 'wikipedia_settings)

;; ---------------------------------------------------------------------- 
;; Appearance customizations
;; ---------------------------------------------------------------------- 

(if (display-graphic-p)
    (load-theme 'ample-zen t)
    ;;(require 'solarized-light-theme)
    ;;(require 'tangotango-theme)
;;    (load-theme 'wombat t)
  (progn
    (load-theme 'wombat t))
  )

(add-to-list 'default-frame-alist '(font . "Courier New 12"))
(set-face-attribute 'default t :font "Courier New 10")
(custom-set-faces '(highlight-indentation-current-column-face ((t nil))))







