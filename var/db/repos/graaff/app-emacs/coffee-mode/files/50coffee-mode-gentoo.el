
;;; coffee-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(autoload 'coffee-mode "coffee-mode" "Mode for editing CoffeeScript")
