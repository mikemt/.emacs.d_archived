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
   (load-theme 'zenburn t)
(progn
    (load-theme 'wombat t))
)

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
 '(custom-safe-themes
   (quote
    ("31f8d16d264e14e8e39c4f291e26cdd5516772a41660ef2ad895244c22024bd2" "376aa013f906020e9d9ca2c6aaf56ccb5fcdaca480e31d4b395d123a47bc8bc5" "7aaee3a00f6eb16836f5b28bdccde9e1079654060d26ce4b8f49b56689c51904" "2a7beed4f24b15f77160118320123d699282cbf196e0089f113245d4b729ba5d" "834cbeacb6837f3ddca4a1a7b19b1af3834f36a701e8b15b628cad3d85c970ff" default)))
 '(package-selected-packages
   (quote
    (vscdark-theme vscode-icon hc-zenburn-theme zenburn-theme which-key magit matlab-mode markdown-mode markdown-mode+ yaml-mode yasnippet-classic-snippets yasnippet-snippets yasnippet org-ref org jedi ido-vertical-mode cython-mode auctex ample-zen-theme ample-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )









