
;;; coffee-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))
(autoload 'sass-mode "sass-mode" "Mode for editing sass")
