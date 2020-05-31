
;;; hcl-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(add-to-list 'auto-mode-alist '("\\.hcl$" . hcl-mode))
(add-to-list 'auto-mode-alist '("\\.nomad$" . hcl-mode))
(autoload 'hcl-mode "hcl-mode" "Mode for editing HCL")
