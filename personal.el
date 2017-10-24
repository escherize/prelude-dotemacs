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

(setq recenter-positions '(middle 0.05 0.93))
(setq scroll-margin 6)
(global-linum-mode 't)

;; fixing font size with linum-mode

(defvar original-font-size)
(setq original-font-size 10)
(defvar font-size)
(setq font-size original-font-size)
(defvar original-font-name)
(setq original-font-name "Fira Code")

(defun change-font-size (f m)
  (setq font-size (funcall f font-size))
  (set-frame-font
   (format "%s-%d" original-font-name font-size)
   t t)
  (message (format "%s %d" m font-size)))

(defun increase-font-size ()
  (interactive)
  (change-font-size '(lambda (x) (+ 1 x)) "Increasing font size to:"))

(defun decrese-font-size ()
  (interactive)
  (change-font-size '(lambda (x) (- x 1)) "Decreasing font size to:"))

(defun reset-font-size ()
  (interactive)
  (change-font-size '(lambda (x) original-font-size)
                    "Resetting font size to original value:"))

(global-set-key (kbd "C--") 'decrese-font-size)
(global-set-key (kbd "C-+") 'increase-font-size)
(global-set-key (kbd "C-x C-0") 'reset-font-size)

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

(setq use-package-always-ensure t)

(use-package color-theme-sanityinc-solarized :disabled t
  :init (load-theme 'sanityinc-solarized-dark))

(use-package color-theme-sanityinc-tomorrow :disabled t
  :init (load-theme 'sanityinc-tomorrow-eighties))

(use-package cyberpunk-theme :disabled t :init (load-theme 'cyberpunk))
(use-package dracula-theme ;; :disabled t
  :init (load-theme 'dracula))

(use-package magit
  :init
  (progn
    (setq magit-commit-show-diff nil)
    (setq magit-auto-revert-mode 1)))

(use-package htmlize)

(use-package multiple-cursors
  :init (progn (setq mc/list-file "./.mc-lists.el"))
  :bind (("C->"     . mc/mark-next-like-this)
         ("C-<"     . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package helm
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    (setq helm-ff-skip-boring-files t)
    (setq helm-grep-ag-command "rg --color=always --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading --line-number %s %s %s")
    (setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:yellow'")))
  :bind (("C-x f" . helm-for-files)))

(use-package clojure-mode
  :config (progn
            (define-clojure-indent
              (button '(:defn))
              (card '(:defn))
              (componentDidMount '(:defn))
              (componentWillMount '(:defn))
              (dnd-drop-card '(:defn))
              (dnd-hover-card '(:defn))
              (dropdown '(:defn))
              (go-loop '(:defn))
              (ident '(:defn))
              (input '(:defn))
              (modal '(:defn))
              (modal-content '(:defn))
              (params '(:defn))
              (query '(:defn))
              (render '(:defn))
              (static '(:defn))
              (text-area '(:defn))
              (transact! '(:defn)))))

(use-package ox-reveal
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

  :defer t
  :init (elpy-enable))

(use-package clj-refactor

  :init (progn
          (require 'clj-refactor)
          (defun my-clojure-mode-hook ()
            (clj-refactor-mode 1)
            (yas-minor-mode 1) ; for adding require/use/import statements
            ;; This choice of keybinding leaves cider-macroexpand-1 unbound
            (cljr-add-keybindings-with-prefix "C-c C-m"))
          (add-hook 'clojure-mode-hook #'my-clojure-mode-hook)))

(use-package wsd-mode

  :init (progn
          (require 'wsd-mode)
          (add-hook 'wsd-mode-hook 'company-mode)))

(use-package idle-highlight-mode

  :init (progn
          (idle-highlight-mode 1)))


(use-package rust-mode

  :init (progn
          (add-hook 'rust-mode-hook #'racer-mode)))

(use-package company)

(use-package racer

  :init (progn
          (require 'rust-mode)
          (add-hook 'racer-mode-hook #'eldoc-mode)
          (add-hook 'racer-mode-hook #'company-mode)

          (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
          (setq company-tooltip-align-annotations t)))

(use-package racket-mode

  :init (progn (add-to-list 'auto-mode-alist '("\\.pp\\'" . racket-mode))))

(use-package dumb-jump
  )

(use-package webpaste

  :bind (("C-c C-p C-b" . webpaste-paste-buffer)
         ("C-c C-p C-r" . webpaste-paste-region)))

(use-package fill-column-indicator
  :init (progn
          (require 'fill-column-indicator)
          (setq fci-rule-column 80)
          (turn-on-fci-mode)))

(use-package prettier-js
  :init
  (progn
    (add-hook 'js2-mode-hook 'prettier-js-mode)
    (add-hook 'js2-mode-hook (flycheck-mode -1))
    ;; (add-hook 'web-mode-hook 'prettier-js-mode)
    (add-to-list 'auto-mode-alist '("\\.less\\'" . prettier-js-mode)))
  :config
  (setq prettier-js-args '("--use-tabs" "false"
                           "--jsx-bracket-same-line" "true"
                           "--parser" "babylon"
                           "--print-width" "80"
                           "--trailing-comma" "none"
                           "--bracket-spacing" "false")))

(use-package zone
  :bind ("C-M-o" . zone))

(use-package restclient
  :bind
  ("C-x M-r" . restclient-mode))

(use-package company-restclient
  :defer 5
  :init
  (add-to-list 'company-backends 'company-restclient))

(use-package highlight-symbol)

(use-package flycheck-joker
  :init (require 'flycheck-joker))

;; end use-package

(defun helm-projectile-ag (&optional options)
  "Helm version of projectile-ag."
  (interactive (if current-prefix-arg (list (read-string "option: " "" 'helm-ag--extra-options-history))))
  (if (require 'helm-ag nil  'noerror)
      (if (projectile-project-p)
          (let ((helm-ag-command-option options)
                (current-prefix-arg nil))
            (helm-do-ag (projectile-project-root) (car (projectile-parse-dirconfig-file))))
        (error "You're not in a project"))
    (error "helm-ag not available")))

(global-set-key (kbd "<C-return>") 'highlight-symbol)

;; ======================================================================
;; ============================== org-mode ==============================
;; ======================================================================

(setq org-agenda-files
      (file-expand-wildcards "~/dv/cisco/*.org" "~/dv/org/*"))

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "|" "DONE")))

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((todo "IN-PROGRESS")
          (tags-todo "+PRIORITY=\"A\"")
          (agenda "")
          (alltodo "")
          (todo "BLOCKED")))))

(setq org-capture-templates
      (quote
       (("w" "Work note" entry
         (file+headline "~/dv/cisco/todo.org" "Jot")
         "* %?\nEntered on %U\n %i\n %a")
        ("c" "Personal" entry
         (file+headline "~/dv/org/notes.org" "Jot")
         "* %?\nEntred on %U"))))

(org-babel-do-load-languages
 'org-babel-load-languages'( (shell . t)))

(global-set-key (kbd "C-c c") 'org-capture)

(defun my-org-mode-hook ()
  (progn
    (flycheck-mode -1)
    (whitespace-mode -1)
    (visual-line-mode 1)))

(add-hook 'org-mode-hook 'my-org-mode-hook)

;; ======================================================================
;; ========================== end org-mode ==============================
;; ======================================================================
(find-file "~/dv/cisco/todo.org")

(server-start)
