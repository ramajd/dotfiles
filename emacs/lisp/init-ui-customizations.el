(menu-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode 1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq compilation-scroll-output t)
(global-hl-line-mode t)

;; (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(fset 'yes-or-no-p 'y-or-n-p)

;; font from https://sourcefoundry.org/hack/
(set-face-attribute 'default nil
		    :family "Hack" :height 110 :weight 'normal)

;; (use-package disable-mouse
;;   :delight
;;   :config (global-disable-mouse-mode))

(use-package beacon
  :config (beacon-mode 1))

(use-package all-the-icons
  :config (when (display-graphic-p)
	    (require 'all-the-icons)))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (setq dashboard-icon-type 'all-the-icons)
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents . 5)
			  (bookmarks . 5)
			  (projects . 5)
			  (agenda . 5)
			  (registers . 5))))

(use-package ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  (global-set-key (kbd "M-p") 'ace-window))

(use-package kaolin-themes
  :config
  (global-set-key (kbd "C-c q 1") (lambda () (interactive) (load-theme 'kaolin-galaxy t)))
  (global-set-key (kbd "C-c q 2") (lambda () (interactive) (load-theme 'kaolin-eclipse t)))
  (global-set-key (kbd "C-c q 3") (lambda () (interactive) (load-theme 'kaolin-ocean t))))

(use-package creamsody-theme
  :config (global-set-key (kbd "C-c q 4") (lambda () (interactive) (load-theme 'creamsody t))))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-atom")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package rich-minority
  :config
  (rich-minority-mode 1)
  (setq rm-blacklist
	(format "^ \\(%s\\)$"
		(mapconcat #'identity
			   '("Fly.*" "Projectile.*" "NoMouse.*" "ivy.*"
			     "company.*" "ARev.*" "Org-roam.*")
			   "\\|"))))

(load-theme 'kaolin-ocean t)

(provide 'init-ui-customizations)
