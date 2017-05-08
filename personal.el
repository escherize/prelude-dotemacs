;; use-package installation:
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives'("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives'("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(package-initialize)
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(message "use-package Installed!")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; non use-package stuff
;;;;;;;;;;;;;;;;;;;;

(setq web-mode-markup-indent-offset 2)

(setq whitespace-line-column 100)
(global-whitespace-mode 1)
(linum-mode 1)

(add-to-list 'auto-mode-alist '("\\.css.pp\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.pmd\\'" . markdown-mode))

(defun lozenge ()
  (interactive)
  (insert-char 9674))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use-package stuff
;;;;;;;;;;;;;;;;
(use-package color-theme-sanityinc-solarized :ensure t :disabled t
  :init (load-theme 'sanityinc-solarized-dark))

(use-package color-theme-sanityinc-tomorrow :ensure t :disabled t
  :init (load-theme 'sanityinc-tomorrow-eighties))

(use-package cyberpunk-theme :ensure t :disabled t
  :init (load-theme 'cyberpunk))

(use-package dracula-theme :ensure t ;;:disabled t
  :init (load-theme 'dracula))



(use-package htmlize :ensure t)

(use-package multiple-cursors
  :ensure t
  :bind (("C->"     . mc/mark-next-like-this)
         ("C-<"     . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package helm
  :ensure t
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    (setq helm-ff-skip-boring-files t))
  :bind (("C-x f" . helm-for-files)))

(use-package cider :ensure t :pin melpa)

(use-package ox-reveal
  :ensure t
  :init
  (progn
    (setq org-reveal-root "./reveal.js")
    (setq org-publish-project-alist
      '(("escherize"
         ;;"org-static-escherize"
         :components ("org-escherize"))
        ("org-escherize"
         ;; Path to Jekyll project.
         :publishing-directory "~/dv/escherize-blog/_posts"
         ;; Path to org files.
         :base-directory "~/dv/escherize-blog/_org/"
         :base-extension "org"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :html-extension "md"
         :with-section-numbers nil
         :table-of-contents nil
         ;; Only export section between <body> </body>
         :body-only t)))))

(use-package elpy
  :ensure t
  :defer t
  :init (elpy-enable))

(use-package clj-refactor
  :ensure t
  :init (progn
          (require 'clj-refactor)
          (defun my-clojure-mode-hook ()
            (clj-refactor-mode 1)
            (yas-minor-mode 1) ; for adding require/use/import statements
            ;; This choice of keybinding leaves cider-macroexpand-1 unbound
            (cljr-add-keybindings-with-prefix "C-c C-m"))
          (add-hook 'clojure-mode-hook #'my-clojure-mode-hook)))

(use-package wsd-mode
  :ensure t
  :init (progn
          (require 'wsd-mode)
          (add-hook 'wsd-mode-hook 'company-mode)))

(use-package idle-highlight-mode
  :ensure t
  :init (progn
          (idle-highlight-mode 1)))


(use-package rust-mode
  :ensure t
  :init (progn
          (add-hook 'rust-mode-hook #'racer-mode)))

(use-package company :ensure t)

(use-package racer
  :ensure t
  :init (progn
          (require 'rust-mode)
          (add-hook 'racer-mode-hook #'eldoc-mode)
          (add-hook 'racer-mode-hook #'company-mode)

          (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
          (setq company-tooltip-align-annotations t)))

(use-package racket-mode
  :ensure t
  :init (progn (add-to-list 'auto-mode-alist '("\\.pp\\'" . racket-mode))))

(find-file "~/dv/todo.org")
