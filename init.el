;; ---------------------------------------------------------------------- 
;; Preliminaries
;; ---------------------------------------------------------------------- 
(setq gc-cons-threshold 100000000)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/packages/")

(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 65))
  (add-to-list 'default-frame-alist '(width . 130))
  (set-frame-position (selected-frame) 950 5))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

(eval-when-compile
  (require 'use-package))

(require 'custom_functions)
(require 'server)

(when (system-is-windows)
  (use-package cygwin-mount
    :config
    (setq cygwin-mount-cygwin-bin-directory "c:/cygwin64/bin")
    (cygwin-mount-activate))

  (use-package setup-cygwin)
  (setq shell-file-name "bash")

  (server-start))


(when (system-is-darwin)
    (add-to-list 'load-path "/opt/local/bin/")
)

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

(use-package powerline
;;  :disabled t
  :ensure t
  :config
  (powerline-default-theme)
  (setq column-number-indicator-zero-based nil)
  )

(use-package conda
  :ensure t
  :init
  (setq conda-location (expand-file-name "~/AppData/miniconda3"))
  (setq conda-anaconda-home conda-location)
  (setq conda-env-home-directory conda-location)
  :config
  (conda-env-initialize-interactive-shells)
  (conda-env-initialize-eshell))

(use-package company
  :ensure t
  :config
  (global-company-mode t)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package company-jedi
  :ensure t
  :config
  (setq jedi:server-command
        (list (concat conda-location "/envs/emacs-jedi/python") jedi:server-script))
  (setq jedi:complete-on-dot t)

  (defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'my/python-mode-hook)
  (add-hook 'python-mode-hook 'jedi:setup)  
  )

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;; ---------------------------------------------------------------------- 
;; Settings
;; ---------------------------------------------------------------------- 

;;(require 'ido-settings)
 (require 'general-settings)
;;(require 'yasnippet_settings)
;;(require 'orgmode_settings)
;;(require 'python_settings)
;;(require 'c_settings)
;;(require 'tex_settings)
;;(require 'matlab_settings)

;;(require 'wikipedia_settings)
;;(require 'moses-mode)

;; ---------------------------------------------------------------------- 
;; Appearance customizations
;; ---------------------------------------------------------------------- 

(when (system-is-windows)
  (set-face-attribute 'default nil
                      :family "MesloLGS NF"
                      :height 90
                      :weight 'normal
                      :width 'normal)
)

(when (system-is-darwin)
   (add-to-list 'default-frame-alist '(font . "Monaco 11"))
   (set-face-attribute 'default t :font "Monaco 11")
)

(put 'downcase-region 'disabled nil)

(defun display-startup-echo-area-message ()
  (message (emacs-init-time)))









(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet-snippets company-jedi company company-mode conda zerodark-theme yasnippet which-key use-package powerline org-ref material-theme leuven-theme jedi ivy-rich ido-vertical-mode ein doom-themes doom-modeline cython-mode counsel auctex ample-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
