(add-hook 'org-mode-hook
          (lambda ()
            (setq-local fill-column 80)
            (auto-fill-mode 1)))


(provide 'init-org)
