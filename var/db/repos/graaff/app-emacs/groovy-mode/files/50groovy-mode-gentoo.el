
;;; groovy-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(add-to-list 'auto-mode-alist '("\\.groovy$" . groovy-mode))
(autoload 'groovy-mode "groovy-mode" "Mode for editing Groovy")
