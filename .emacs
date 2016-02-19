;; ----------------------------------------------------------------------
;; Emacs initialisation file
;;
;;
;; 
;; 
;; ----------------------------------------------------------------------

;; load path
(add-to-list 'load-path "~/.emacs.d/lisp/")
(let ((default-directory  "~/.emacs.d/lisp/"))
  (setq load-path
        (append
         (let ((load-path  (copy-sequence load-path))) ;; Shadow
           (normal-top-level-add-subdirs-to-load-path))
         load-path)))


;; emacsclient set-up
(defvar server-buffer-clients)
(when (and (fboundp 'server-start) (string-equal (getenv "term") 'xterm))
(server-start)
(defun fp-kill-server-with-buffer-routine ()
(and server-buffer-clients (server-done)))
(add-hook 'kill-buffer-hook 'fp-kill-server-with-buffer-routine))

(if (locate-library "edit-server")
    (progn
      (require 'edit-server)
      (setq edit-server-new-frame nil)
      (edit-server-start)))

;; initialise packages in ~/.emacs.d/epla
(require 'package) (package-initialize) 

;; Appearance turn off toolbar
(when (display-graphic-p)
    (tool-bar-mode -1) ; turn off toolbar
    ;; changing the default frame size at start up
    (set-frame-height (selected-frame) 48)
    (set-frame-width (selected-frame) 80)
    (set-frame-position (selected-frame) 10 0)
)

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; check wich emacs we are running, and on which platform
(cond
     ((string-match "nt4" system-configuration)
      (message "customizing gnu emacs for win nt")
      (add-to-list 'load-path "c:\\cygwin\bin")
      )
     ((string-match "linux" system-configuration)
      (message "customizing gnu emacs for linux")
                 ; anything special about linux begins here 
     )
)

(setq ns-pop-up-frames nil)

;; create a reasonable titlebar for emacs, which works
;; on both windows and unix.
;; note: assumes hostname is exported.
(defun create_title_format (user host)
  "creates a window title string"
  (interactive)
  (list (getenv user) "@" (getenv host) ":"
        '(:eval
          (if buffer-file-name
              (replace-regexp-in-string
               (getenv "home")
               "~"
               (buffer-file-name))
            (buffer-name))))
  )

;; set window and icon title.
(if (eq system-type 'windows-nt)
    (setq frame-title-format
          (create_title_format "username" "computername"))
  (setq frame-title-format
        (create_title_format "user" "hostname")))

(setq frame-title-format
          '(buffer-file-name
            "%f"
            (dired-directory dired-directory "%b")))


;; windmove
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

; ------------------------------------------------------------
; org mode

;; the following lines are always needed.  choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;(autoload 'org-mode "org" "org mode" t)
;;(autoload 'orgstruct-mode "org" "org structure as a minor mode." t)

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(setq reftex-default-bibliography
      (quote
       ("/Users/mmthomas/SkyDrive/collection/bibliography.bib")))
(setq org-src-fontify-natively t)
;; -----------------------------------------------------------------
;; key customisations

;; replace m-tab for completion with s-tab 
(define-key global-map (kbd "<s-tab>")
  (lambda ()
    (interactive)
    (call-interactively (key-binding "\M-\t"))))

;; access to m-x compile
(define-key global-map [f6] 'compile)

(defun copy-line (&optional arg)
  "do a kill-line but copy rather than kill.  this function directly calls
kill-line, so see documentation of kill-line for how to use it including prefix
argument and relevant variables.  this function works by temporarily making the
buffer read-only, so i suggest setting kill-read-only-ok to t."
  (interactive "p")
  (toggle-read-only 1)
  (kill-line arg)
  (toggle-read-only 0))

(setq-default kill-read-only-ok t)
(global-set-key "\C-c\C-k" 'copy-line)

;; -----------------------------------------------------------------
;; customisations
(custom-set-faces
 '(default ((t 
	     (:stipple nil 
	      :background "white" 
	      :foreground "black" 
	      :inverse-video nil 
	      :box nil 
	      :strike-through nil 
	      :overline nil 
	      :underline nil 
	      :slant normal 
	      :weight normal 
	      :height 140 
	      :width normal 
	      :family "courier new")
	     ))
    )
 )
 

(custom-set-variables
  ;; custom-set-variables was added by custom.
  ;; if you edit it by hand, you could mess it up, so be careful.
  ;; your init file should contain only one such instance.
  ;; if there is more than one, they won't work right.
 '(latex-math-list (quote ((57 "left( \\right)" "" nil) (54 "partial" "" nil) (50 "sqrt{}" "" nil) (47 "frac{}{}" "" nil))))
 '(case-fold-search t)
 '(current-language-environment "latin-1")
 '(default-input-method "latin-1-prefix")
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; prevent emacs from making backup files
 (setq make-backup-files nil) 

;; --------------------------------------------------------------------------
;; aspell  

;; replace ispell
(setq-default ispell-program-name "aspell")

;; binding the ispell complete word
(global-set-key "\C-c\C-v" 'ispell-complete-word)

;; --------------------------------------------------------------------------
;; auctex mode

(require 'tex-site)
(setq TeX-parse-self t)
; (setq TeX-auto-save t)
(setq-default TeX-master nil)

;(load "tex-site")
;(load "tex-mik")

;(load "preview-latex.el" nil t t)
;(setq preview-image-type 'pnm)

;; --------------------------------------------------------------------------
;; RefTeX mode 
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make Citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase Mode" t)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; Custom key bindings
(define-key global-map [f5] 'do-LaTeX) ; LaTeX
;; (define-key global-map [f6] 'TeX-next-error) ; goto next found - LaTeX error
(define-key global-map [f7] 'do-BiBTeX) ; BiBTeX
(define-key global-map [f8] 'do-View) ; View the dvi file
(define-key global-map [f9] 'do-dvi2ps) ; dvi2ps the file

(defun do-LaTeX ()
  "LaTeX the current master file"
  (interactive)
  (beginning-of-line)
  (TeX-command "LaTeX" 'TeX-master-file)
)

(defun do-BiBTeX ()
  "BibTeX the current master file"
  (interactive)
  (beginning-of-line)
  (TeX-command "BibTeX" 'TeX-master-file)
)

(defun do-View ()
  "View the current file"
  (interactive)
  (beginning-of-line)
  (TeX-command "View" 'TeX-master-file)
)

(defun do-dvi2ps ()
  "dvi2ps the current file"
  (interactive)
  (beginning-of-line)
  (TeX-command "File" 'TeX-master-file)
)

;; --------------------------------------------------------------------------
;; MATLAB mode 

    (add-to-list 'load-path "~/matlab")

    (autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
    (setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
    (autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)


    (setq matlab-indent-function t); if you want function bodies indented
    (setq matlab-verify-on-save-flag nil); turn off auto-verify on save
    (defun my-matlab-mode-hook ()
       (setq fill-column 76)
       (imenu-add-to-menubar "Find")); where auto-fill should wrap
     (add-hook 'matlab-mode-hook 'my-matlab-mode-hook)

;; --------------------------------------------------------------------------
;; --------------------------------------------------------------------------
;; Python
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; iPython mode
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq ipython-command "ipython-2.7")
(require 'ipython)
(setq py-python-command-args '("--pylab"  "--colors" "Linux"))

;; Cython mode
(require 'cython-mode)
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxd\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxi\\'" . cython-mode))

;; --------------------------------------------------------------------------
;; --------------------------------------------------------------------------
;; Yasnippet


;;(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0")
;;(require 'yasnippet-bundle)
;;(require 'yasnippet) ;; not yasnippet-bundle
;(yas/initialize)
;(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

(yas-global-mode 1)

;; --------------------------------------------------------------------------
;; --------------------------------------------------------------------------
;; Wikipedia mode

(autoload 'wikipedia-mode "wikipedia-mode.el"
"Major mode for editing documents in Wikipedia markup." t)

(add-to-list 'auto-mode-alist
'("\\.wiki\\'" . wikipedia-mode))

; To load with view source from within firefox 3.x
(add-to-list 'auto-mode-alist
'("en\\.wikipedia\\.org" . wikipedia-mode))
(add-to-list 'auto-mode-alist '("index.\\.*" . wikipedia-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; word-count-region
; by Robert J. Chassell -- programming in emacs lisp
(defun latex-word-count ()
  (interactive)
  (shell-command (concat "~/.emacs.d/texcount.pl "
                         ; "uncomment then options go here "
                         (buffer-file-name))))


;;; Final version: while

(defun count-words-region (beginning end)
  "Print number of words in the region."
  (interactive "r")
  (message "Counting words in region ... ")

;;; 1. Set up appropriate conditions.
  (save-excursion
    (let ((count 0))
      (goto-char beginning)

;;; 2. Run the while loop.
      (while (and (< (point) end)
                  (re-search-forward "\\w+\\W*" end t))
        (setq count (1+ count)))

;;; 3. Send a message to the user.
      (cond ((zerop count)
             (message
              "The region does NOT have any words."))
            ((= 1 count)
             (message
              "The region has 1 word."))
            (t
             (message
              "The region has %d words." count))))))

;; Count the words in the entire document
(defun count-words-buffer ()
  "Count all the words in the buffer"
  (interactive)
  (count-words-region (point-min) (point-max) )
)

; binding this to a key combination
(global-set-key "\C-c\C-c" 'count-words-buffer)















