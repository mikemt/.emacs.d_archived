(provide 'ido-settings)

(require 'ido-vertical-mode)
(ido-mode t)
(ido-vertical-mode t)

(with-eval-after-load "ido"
  (setq ido-enable-prefix nil
	ido-case-fold  nil
	ido-use-virtual-buffers t))
