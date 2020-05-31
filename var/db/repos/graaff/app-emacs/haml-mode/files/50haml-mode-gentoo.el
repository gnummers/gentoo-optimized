
;;; coffee-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(autoload 'haml-mode "haml-mode" "Mode for editing HAML")
