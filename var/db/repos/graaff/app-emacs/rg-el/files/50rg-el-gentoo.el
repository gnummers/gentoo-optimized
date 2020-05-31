
;;; rg.el site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'rg-project "rg.el" "" t)
(autoload 'rg-dwim-project-dir "rg.el" "" t)
(autoload 'rg-dwim-current-dir "rg.el" "" t)
(autoload 'rg-dwim-current-file "rg.el" "" t)
(autoload 'rg-dwim "rg.el" "" t)
(autoload 'rg-literal "rg.el" "" t)
(autoload 'rg "rg.el" "" t)
