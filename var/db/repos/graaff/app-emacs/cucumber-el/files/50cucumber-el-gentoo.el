
;;; coffee-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))
(autoload 'feature-mode "feature-mode" "Mode for editing Cucumber stories")
