;;
;; straight.el initiation
;;
(setq package-enable-at-startup nil)

(package-initialize)
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)
(setq use-package-verbose t)
(setq straight-use-package-by-default t)


;;
;; setup custom file
;;
(setq custom-file "~/.emacs.d/custom-file.el")
(load-file custom-file)


;;
;; additional configurations
;;
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-ui-customizations)
(require 'init-common)
(require 'init-treemacs)
(require 'init-projectile)
(require 'init-magit)
(require 'init-rust-mode)
(require 'init-blogging)
