;; remove help buffer
(setq inhibit-startup-message t)

;; hide top toolbar, menubar and scrollbar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; highlight current line
;;(global-hl-line-mode t)
(global-linum-mode t)
(line-number-mode t)
;;(add-hook 'window-setup-hook 'maximize-frame t)
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; just in macos
; (seqt mac-command-modifier 'meta)


(setq custom-file "~/.emacs.d/custom-file.el")
(load-file custom-file)

;; Packages
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(defvar myPackages
  '(better-defaults
    material-theme
    humanoid-themes
    use-package))

(mapc #'(lambda (package)
	 (unless (package-installed-p package)
	   (package-install package)))
      myPackages)


;; Additional package definitions
(load-file "~/.emacs.d/packages.el")

;; Python development
;;(elpy-enable)

