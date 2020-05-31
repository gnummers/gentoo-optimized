
;;; ponylang-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(add-to-list 'auto-mode-alist '("\\.pony$" . ponylang-mode))
(autoload 'ponylang-mode "ponylang-mode" "Mode for editing pony")
