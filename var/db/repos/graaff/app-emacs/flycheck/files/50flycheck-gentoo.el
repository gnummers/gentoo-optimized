
;;; flycheck site-lisp configuration

(add-to-list 'load-path "@SITELISP@")

(autoload 'flycheck-manual "flycheck" "Open the Flycheck manual")
(autoload 'flycheck-mode "flycheck" "Minor mode for on-the-fly syntax checking")
(autoload 'global-flycheck-mode "flycheck")

