;; -- moses-mode.el --

;; simple moses mode for emacs based on generic mode

;; -- moses-mode.el --
(provide 'moses-mode)

(require 'generic-x) ;; we need this    

(define-generic-mode 
    ;; name of the mode to create                        
    'moses-mode     
    ;; comments start with '$'
    '("$")                           
    ;; some keywords
    '("end"
      "fr_fcargo"
      "freq_response"
      "hydro"
      "inmodel"
      "matrices"
      "type"
      "report"
      "set_variable" "set_vari"
      "v_matrices"
      "&apply"
      "&body"
      "&channel"
      "&ctype" 
      "&data"
      "&default" 
      "&describe" 
      "&device" 
      "&dimen"  
      "&endmacro"
      "&env"
      "&eofile"
      "&exit"
      "&file"
      "&fini" "&finish"
      "&format"
      "&if" "&endif" "&elseif" "&else" "&then"
      "&insert"
      "&logical"
      "&loop" "&endloop" 
      "&macro" 
      "&m_active"
      "&number" 
      "&parameter" 
      "&part" 
      "&picture"
      "&point"
      "&report"
      "&rep_sel" 
      "&set" "&instate" 
      "&set_var"
      "&stat" "&status"  
      "&string"
      "&subtitle"
      "&summary"
      "&title" 
      "&token"
      "&type"
      "&weight"
     )                      
;;  '(("%{\\(-[A-Z_]+\\)}" 1 font-lock-variable-name-face)
;    ("\\b[0-9][0-9][0-9]\\b" . font-lock-constant-face)
;    ("\\[.*\\]" . font-lock-type-face))
   '(("=" . 'font-lock-operator)     ;; '=' is an operator
    (";" . 'font-lock-builtin))     ;; ';' is a built-in 
   '("\\.cif$")                      ;; files for which to activate this mode 
  nil                              ;; other functions to call
  "A moses mode for emacs"          ;; doc string for this mode
  )

