;; ----------------------------------------------------------------------
;; Python Settings
;; ----------------------------------------------------------------------
(provide 'python_settings)


;; (use-package jedi
;;   :ensure t
;;   :config
;;   (setq jedi:environment-root "jedi")
;;   (setq jedi:environment-virtualenv
;;       (append python-environment-virtualenv
;;               '("--python" "c:/ProgramData/Anaconda/python.exe")))
;;   (setq jedi:complete-on-dot t)
;;   (setq jedi:get-in-function-call-delay 10000000)
;; )


;;(setq jedi-config:use-system-python t)
(add-to-list 'ac-sources 'ac-source-jedi-direct)
(add-hook 'python-mode-hook 'jedi:setup)

(use-package cython-mode
  :ensure t)

(use-package ein
  :ensure t)


