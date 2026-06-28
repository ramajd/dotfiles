(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8ca8fbaeaeff06ac803d7c42de1430b9765d22a439efc45b5ac572c2d9d09b16" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages
   '(org2web org-static-blog treemacs-magit treemacs-icons-dired treemacs-projectile treemacs elpy humanoid-themes material-theme company-jedi ac-geiser paredit smex ido-completing-read+ magit use-package company spacemacs-theme))
 '(safe-local-variable-values
   '((eval modify-syntax-entry 43 "'")
     (eval modify-syntax-entry 36 "'")
     (eval modify-syntax-entry 126 "'")
     (eval let*
	   ((root-dir
	     (expand-file-name
	      (locate-dominating-file default-directory ".dir-locals.el")))
	    (root-dir*
	     (directory-file-name root-dir)))
	   (unless
	       (boundp 'geiser-guile-load-path)
	     (defvar geiser-guile-load-path 'nil))
	   (make-local-variable 'geiser-guile-load-path)
	   (require 'cl-lib)
	   (cl-pushnew root-dir* geiser-guile-load-path :test #'string-equal))
     (eval setq guix-directory
	   (locate-dominating-file default-directory ".dir-locals.el")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
