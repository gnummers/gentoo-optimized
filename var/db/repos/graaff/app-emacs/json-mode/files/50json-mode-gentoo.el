;; json-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")

(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

(autoload 'json-mode "json-mode" "Mode for editing JSON")

;;; 50json-mode-gentoo.el ends here

