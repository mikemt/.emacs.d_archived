;; ----------------------------------------------------------------------
;; Emacs initialisation file
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


;; -----------------------------------------------------------------
;; key customisations

;; replace m-tab for completion with s-tab 
(define-key global-map (kbd "<s-tab>")
  (lambda ()
    (interactive)
    (call-interactively (key-binding "\M-\t"))))


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


;; --------------------------------------------------------------------------
;; aspell  

;; replace ispell


;; binding the ispell complete word



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















