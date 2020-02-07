;; ----------------------------------------------------------------------
;; General Settings
;; ----------------------------------------------------------------------
(provide 'general-settings)

(require 'which-key)
(which-key-mode)

(let* ((cygwin-root "c:/cygwin64")
         (cygwin-bin (concat cygwin-root "/bin")))
    (when (and (eq 'windows-nt system-type)
  	     (file-readable-p cygwin-root))
    
      (setq exec-path (cons cygwin-bin exec-path))
      (setenv "PATH" (concat cygwin-bin ";" (getenv "PATH")))
    
      ;; By default use the Windows HOME.
      ;; Otherwise, uncomment below to set a HOME
      ;;      (setenv "HOME" (concat cygwin-root "/home/eric"))
    
      ;; NT-emacs assumes a Windows shell. Change to bash.
      (setq shell-file-name "bash")
      (setenv "SHELL" shell-file-name) 
      (setq explicit-shell-file-name shell-file-name) 
    
      ;; This removes unsightly ^M characters that would otherwise
      ;; appear in the output of java applications.
      (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)))



;;(if (system-is-windows)
;;    (add-to-list 'load-path "c:/cygwin64/bin"))

;;(if (display-graphic-p)
;;    (set-exec-path-from-shell-PATH))

;; Hunspell Settings
(require 'ispell)
;;(setq ispell-local-dictionary-alist
;;      '(("en_US" "C:/cygwin64/usr/share/myspell/en_US.dic")
;;        ("en_GB" "C:/cygwin64/usr/share/myspell/en_GB.dic")))
;;(setenv "DICTIONARY" "en_GB")
;;(setq ispell-program-name "hunspell.exe")
;;(setq-default ispell-program-name "c:/cygwin64/bin/hunspell.exe")
;;(setq ispell-dictionary "en_GB")
;;(setq ispell-personal-dictionary "~/.emacs.d/ispell/personal.en")

(setq inhibit-startup-screen 1)
(size-indication-mode 1)         ;; auto text size
(setq backup-inhibited t)        ;; no ~ backup pollution 
(setq auto-save-default nil)     ;; no autosave
(setq frame-title-format '(buffer-file-name "%f"))
(setq ring-bell-function 'ignore)


;; Behaviour
(setq-default kill-read-only-ok t)
(add-hook 'term-exec-hook 'set-no-process-query-on-exit)
(defalias 'yes-or-no-p 'y-or-n-p)

;; don't show the tool bar
(require 'tool-bar)
(tool-bar-mode 0)
;; don't show the scroll bar
(if window-system (scroll-bar-mode 0))
(setq ns-pop-up-frames nil)

;; default window width and height
(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 55))
  (add-to-list 'default-frame-alist '(width . 90))
  (set-frame-position (selected-frame) 0 0))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

;; highlight parentheses
(require 'paren)
(show-paren-mode 1)

;; Turn off blinking cursor
(blink-cursor-mode 0)

;; Column and line numbers
(line-number-mode 1)
(column-number-mode 1)
(global-linum-mode t)
(setq column-number-indicator-zero-based nil) ;; set column numbers to start at 1

;; Trurn on transient mark mode
(transient-mark-mode 1)

(require 'font-lock)
(global-font-lock-mode 1)
(global-hi-lock-mode nil)

;; Fill tabs with whitespace
(setq-default indent-tabs-mode nil)

;; number of characters until the fill column
(setq-default fill-column 70)
(setq-default truncate-lines 1)
(setq truncate-partial-width-windows 1)

;; ignore case when searching
(setq-default case-fold-search 1)

;; require final newlines in files
(setq require-final-newline 1)
;; Add a new line when going to the next line
(setq next-line-add-newlines t)

;;(put 'downcase-region 'disabled nil)
;;(put 'upcase-region 'disabled nil)

;; keybinds
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "M-<up>") 'beginning-of-buffer)
(global-set-key (kbd "M-<down>") 'end-of-buffer)
(global-set-key (kbd "<f5>") 'revert-buffer)
(define-key global-map "\C-c\C-k" 'copy-line)
(global-set-key "\C-c\C-c" 'count-words-buffer)
(global-set-key "\C-c\C-v" 'ispell-complete-word)
(global-set-key (kbd "S-<left>")  'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<up>")    'windmove-up)
(global-set-key (kbd "S-<down>")  'windmove-down)

(if (system-is-darwin)
        (setq ns-command-modifier 'meta))

