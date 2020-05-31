
;;; imenu-list site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'imenu-list-noselect "imenu-list" "Update and show the imenu-list buffer but don't select it." t)
(autoload 'imenu-list "imenu-list" "Update and show the imenu-list." t)
(autoload 'imenu-list-minor-mode "imenu-list" "imenu-list minor mode")
(autoload 'imenu-list-smart-toggle "imenu-list" "Smart enable/disable imenu-list minor mode" t)

