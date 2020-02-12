(provide 'autocomplete_settings)

(use-package auto-complete
  :ensure t)

(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode 1)
(setq ac-auto-show-menu (* ac-delay 2))
(setq ac-ignore-case nil)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
;;(setq tab-always-indent ‘complete)

(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/opt/local/include"))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode 'my:ac-c-headers-init)




