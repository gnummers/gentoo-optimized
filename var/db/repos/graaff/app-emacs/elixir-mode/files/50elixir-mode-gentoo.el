
;;; coffee-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(add-to-list 'auto-mode-alist '("\\.elixir$" . elixir-mode))
(add-to-list 'auto-mode-alist '("\\.ex$" . elixir-mode))
(add-to-list 'auto-mode-alist '("\\.exs$" . elixir-mode))

(autoload 'elixir-mode "elixir-mode" "Mode for editing Elixir")
