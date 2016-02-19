(require 'generic-x) ;; we need this

(define-generic-mode 
  'moses-mode                         ;; name of the mode to create
  '("$")                              ;; comments start with '!!'
  '("&status" "&set" 
    "end" "END" "&WEIGHT")          ;; some keywords
  '(("=" . 'font-lock-operator)     ;; '=' is an operator
    (";" . 'font-lock-builtin))     ;; ';' is a a built-in 
  '("\\.cif$")                      ;; files for which to activate this mode 
   nil                              ;; other functions to call
  "A moses mode for emacs"          ;; doc string for this mode
)