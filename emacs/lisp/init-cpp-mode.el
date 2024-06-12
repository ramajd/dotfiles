(require 'clang-format)
(global-set-key (kbd "C-c C-f") 'clang-format-region)

(use-package modern-cpp-font-lock
  :config
  (modern-c++-font-lock-global-mode t))

(which-key-mode)

(use-package lsp-mode
  :hook ((c-mode . lsp)
         (c++-mode . lsp))
  :config
  (setq lsp-idle-delay 0.1))


(use-package dap-mode)

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))


(provide 'init-cpp-mode)
