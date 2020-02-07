;; ----------------------------------------------------------------------
;; Python Settings
;; ----------------------------------------------------------------------
(provide 'python_settings)

(require 'jedi)
(setq jedi-config:use-system-python t)
(add-to-list 'ac-sources 'ac-source-jedi-direct)
(add-hook 'python-mode-hook 'jedi:setup)

(setq jedi:complete-on-dot t)
(setq jedi:get-in-function-call-delay 10000000)

;; Cython mode
(require 'cython-mode)


