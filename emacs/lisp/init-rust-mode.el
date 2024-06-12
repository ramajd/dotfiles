(use-package rust-mode
  :bind
  ("C-c r" . rust-run)
  ("C-c c" . rust-compile)
  ("C-c t" . rust-test)
  :config
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq rust-format-on-save t)
  (setq rust-indent-offset 4))

(use-package cargo-mode
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package eglot
  :config
  (add-hook 'rust-mode-hook 'eglot-ensure)
  (add-to-list 'eglot-server-programs
               '((rust-ts-mode rust-mode) . ("rust-analyzer" :initializationOptions (:check (:command "clippy"))))))

(provide 'init-rust-mode)
