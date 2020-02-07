(provide 'autocomplete_settings)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode 1)
(setq ac-auto-show-menu (* ac-delay 2))
(setq ac-ignore-case nil)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
;;(setq tab-always-indent ‘complete)



