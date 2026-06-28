(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq backup-directory-alist '(("." . "~/.emacs.d/saves")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/saves" t)))

(electric-pair-mode)
(global-set-key (kbd "C-<tab>") 'other-window)

(use-package package-lint)

(use-package counsel
  :init (ivy-mode 1)
  :config
  (setq ivy-height 10)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (global-set-key "\C-s" 'swiper)
  (setq projectile-completion-system 'ivy)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "C-c e e") 'counsel-rg)
  (global-set-key (kbd "C-c e n") 'counsel-fzf))

(use-package company
  :config
  (global-company-mode)
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0))

(use-package recentf
  :config
  (setq recentf-auto-cleanup 'never
        recentf-max-saved-items 1000
        recentf-save-file (concat user-emacs-directory ".recentf")))

(defun eshell-new()
  "Open a new instance of eshell."
  (interactive)
  (eshell 'N))

(provide 'init-common)
