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
    (use-package doom-themes
       :ensure t
       :config
       (load-theme 'doom-gruvbox)
       (doom-themes-org-config))
  )

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  (setq doom-modeline-icon t)
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
 )

(use-package conda
  :ensure t
  :init
  (setq conda-location (expand-file-name "~/.miniconda"))
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
  ;; requires: jedi, sexpdata, epc to be installed in the environment 
  (setq jedi:server-command
        (list (concat conda-location "/envs/py37/bin/python") jedi:server-script))
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

(defun my/org-mode-hook ()
  "Stop the org-level headers from increasing in height relative to the other text."
  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5))
    (set-face-attribute face nil :weight 'semi-bold :height 1.0 :box nil)))

(add-hook 'org-mode-hook 'my/org-mode-hook)


(use-package expand-region
  :ensure t
  :bind ("M-m" . er/expand-region))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-paren-mode t)))

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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "1ed5c8b7478d505a358f578c00b58b430dde379b856fbcb60ed8d345fc95594e" "845103fcb9b091b0958171653a4413ccfad35552bc39697d448941bcbe5a660d" "4db938d41459251ee398fbc7a6df3e05f21c2b88c06f8adfdf5ae0eab458affa" "a339f231e63aab2a17740e5b3965469e8c0b85eccdfb1f9dbd58a30bdad8562b" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "669e02142a56f63861288cc585bee81643ded48a19e36bfdf02b66d745bcc626" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "679ee3b86b4b34661a68ba45bbd373eab0284caee6249139b2a090c9ddd35ce0" "2a7beed4f24b15f77160118320123d699282cbf196e0089f113245d4b729ba5d" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "7aaee3a00f6eb16836f5b28bdccde9e1079654060d26ce4b8f49b56689c51904" "d74fe1508cff43708fa2f97c4bf58d19f0e002b2e0c92bf958bf483113b7d89d" "ae65ccecdcc9eb29ec29172e1bfb6cadbe68108e1c0334f3ae52414097c501d2" default)))
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(ivy-count-format "(%d/%d)")
 '(ivy-use-virtual-buffers t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (magit all-the-icons atom-one-dark-theme ample-zen-theme sublime-themes sunburn-theme reverse-theme moe-theme yasnippet-snippets company-jedi company company-mode conda zerodark-theme yasnippet which-key use-package powerline org-ref material-theme leuven-theme jedi ivy-rich ido-vertical-mode ein doom-themes doom-modeline cython-mode counsel auctex ample-theme)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
