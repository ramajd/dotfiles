;; Blogging configuration using org-static-blog
;; https://github.com/bastibe/org-static-blog

(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-to-list 'ispell-skip-region-alist '(":\\(PROPERTIES\\|LOGBOOK\\|filetags\\):" . ":END:"))
(add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_SRC" . "#\\+END_SRC"))

(use-package org-static-blog
  :ensure t
  :config
  (setq org-static-blog-publish-title "Personal Notes by ramajd")
  (setq org-static-blog-publish-url "https://ramajd.github.io/")
  ;;(setq org-static-blog-publish-url "/home/reza/personal/ramajd.github.io/")
  (setq org-static-blog-publish-directory "~/personal/ramajd.github.io/")
  (setq org-static-blog-posts-directory "~/personal/ramajd.github.io/posts/")
  (setq org-static-blog-drafts-directory "~/personal/ramajd.github.io/drafts/")
  (setq org-static-blog-enable-tags t)
  (setq org-export-with-toc nil)
  (setq org-export-with-section-numbers nil)
  (setq org-static-blog-use-preview nil)

  (setq org-static-blog-page-header "
<meta name=\"author\" content=\"Reza Alizadeh Majd\">
<meta name=\"referrer\" content=\"no-referrer\">
<link href=\"static/style.css\" rel=\"stylesheet\" type=\"text/css\" />
<link rel=\"icon\" href=\"static/favicon.png\">")

  (setq org-static-blog-page-preamble "
<div class=\"header\">
  <a href=\"https://ramajd.github.io\">Personal Notes by ramajd</a>
  <ul>
    <li><a href=\"index.html\">Blog</a>
    <li><a href=\"about.html\">About</a>
  </ul>
</div>")

  (setq org-static-blog-page-postamble "
<center>
  <a rel=\"license\" href=\"https://creativecommons.org/licenses/by-sa/3.0/\">
    <img alt=\"Creative Commons License\" 
         style=\"border-width:0\" 
         src=\"https://i.creativecommons.org/l/by-sa/3.0/88x31.png\" /></a>
  <br />
  licensed under a 
  <a rel=\"license\" href=\"https://creativecommons.org/licenses/by-sa/3.0/\">
    Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.
</center>"
))




