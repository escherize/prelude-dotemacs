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

(setq recenter-positions '(middle 0.03 0.96))
(setq scroll-margin 3)

;; fixing font size with linum-mode
(defvar original-font-size)
(defvar font-size)
(defvar original-font-name)

(setq original-font-size 14)
(setq font-size original-font-size)
;;(setq original-font-name "Fira Code")
(setq original-font-name "Fira Mono")
;;(setq original-font-name "Menlo")
;;(setq original-font-name "Anonymous Pro")
;;(setq original-font-name "Source Code Pro")

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

(reset-font-size)

(global-set-key (kbd "C--") 'decrese-font-size)
(global-set-key (kbd "C-+") 'increase-font-size)
(global-set-key (kbd "C-x C-0") 'reset-font-size)

(setq web-mode-markup-indent-offset 2)
(setq global-hl-line-mode 'f)
(setq whitespace-line-column 100)
(global-whitespace-mode 1)
(linum-mode 1)

(add-to-list 'auto-mode-alist '("\\.css.pp\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.pmd\\'" . markdown-mode))

;; ======================================================================
;; ============================== org-mode ==============================
;; ======================================================================


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use-package stuff
;;;;;;;;;;;;;;;;

(setq use-package-always-ensure t)

;; (use-package color-theme-sanityinc-solarized
;;   :disabled t
;;   :init (load-theme 'sanityinc-solarized-dark))

;; (use-package color-theme-sanityinc-tomorrow
;;   :disabled t
;;   :init (load-theme 'sanityinc-tomorrow-night))

;; (use-package cyberpunk-theme
;;   :disabled t
;;   :init (load-theme 'cyberpunk))

;; (use-package dracula-theme
;;   :disabled t
;;   :init (load-theme 'dracula))

;; (use-package ample-theme
;;   :disabled t
;;   :init (progn
;;           ;;(load-theme 'ample-flat t t)
;;           ;;(enable-theme 'ample)
;;           (load-theme 'ample t t)
;;           (enable-theme 'ample))
;;   :defer t)

(use-package markdown-mode)

;; (use-package powerline
;;   :init (require 'powerline))

;; (use-package moe-theme
;;   :init (progn
;;           (require 'moe-theme)
;;           ;; Show highlighted buffer-id as decoration. (Default: nil)
;;           (setq moe-theme-highlight-buffer-id nil)

;;           ;; Resize titles (optional).
;;           (setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
;;           (setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
;;           (setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))

;;           ;; Choose a color for mode-line.(Default: blue)
;;           ;; colors: blue, orange, magenta, yellow, purple, red, cyan, w/b.
;;           (moe-theme-random-color)
;;           (moe-theme-resize-font-size)
;;           (show-paren-mode t)
;;           (setq show-paren-style 'mixed)
;;           (setq show-paren-delay 0.125)

;;           (powerline-moe-theme)
;;           (moe-dark)))

(use-package doom-themes
  :init
  (progn
    (require 'doom-themes)

    ;; Global settings (defaults)
    (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
          doom-themes-enable-italic t) ; if nil, italics is universally disabled

    ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
    ;; may have their own settings.
    (load-theme 'doom-one t)

    ;; Enable flashing mode-line on errors
    (doom-themes-visual-bell-config)

    ;; Enable custom neotree theme (all-the-icons must be installed!)
    (doom-themes-neotree-config)
    ;; or for treemacs users
    (doom-themes-treemacs-config)

    ;; Corrects (and improves) org-mode's native fontification.
    (doom-themes-org-config)))

(use-package doom-modeline
  :ensure t
  :commands doom-modeline-mode
  :init (progn

          ;; Whether display minor modes in mode-line or not.
          (setq doom-modeline-minor-modes nil))
  :hook (after-init . doom-modeline-mode))

(use-package magit
  :init
  (progn
    (setq magit-commit-show-diff nil)
    (setq magit-refresh-status-buffer nil)
    (setq auto-revert-buffer-list-filter
          'magit-auto-revert-repository-buffers-p)
    (remove-hook 'magit-refs-sections-hook 'magit-insert-tags)
    (remove-hook 'server-switch-hook 'magit-commit-diff)
    (setq vc-handled-backends nil)
    (setq vc-handled-backends (delq 'Git vc-handled-backends))
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
    (setq helm-candidate-number-limit 50)
    (setq helm-ff-skip-boring-files t)
    (setq helm-grep-ag-command "rg --color=always \ --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading --line-number %s %s %s")
    (setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:yellow'")))
  :bind (("C-x f" . helm-for-files)))

(use-package clojure-mode
  :config (progn
            (define-clojure-indent
              (button '(:defn))
              (card '(:defn))
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
              (transact! '(:defn))

              (dofor 1)
              (forv 1)
              (for* 1)
              (combofor 1)
              (and-let 1)
              (returning 1)
              (returning-let 1)
              (this-as 1)
              (synchronized 0)
              (careful-future 0)
              (send-off 1)
              (debounced 1)
              (lock-swap! 1)
              (while-some 1)
              (swap!)
              ;; reframe:
              (reg-event-fx '(:defn))
              (reg-event-db'(:defn)))))

(use-package clj-refactor
  :init (progn
          (require 'clj-refactor)
          (defun my-clojure-mode-hook ()
            (clj-refactor-mode 1)
            (yas-minor-mode 1) ; for adding require/use/import statements
            ;; This choice of keybinding leaves cider-macroexpand-1 unbound
            (cljr-add-keybindings-with-prefix "C-c C-m"))
          (add-hook 'clojure-mode-hook #'my-clojure-mode-hook)))

(use-package flycheck-joker
  :init (progn
          (require 'flycheck-joker)
          (defun clj-joker-hook () (flycheck-mode 1))
          (add-hook 'clojure-mode-hook #'clj-joker-hook)))

;; (use-package ox-reveal
;;   :init
;;   (progn
;;     (setq org-reveal-root "./reveal.js")
;;     (setq org-publish-project-alist
;;           '(("escherize"
;;              ;;"org-static-escherize"
;;              :components ("org-escherize"))
;;             ("org-escherize"
;;              ;; Path to Jekyll project.
;;              :publishing-directory "~/dv/escherize-blog/_posts"
;;              ;; Path to org files.
;;              :base-directory "~/dv/escherize-blog/_org/"
;;              :base-extension "org"
;;              :recursive t
;;              :publishing-function org-html-publish-to-html
;;              :headline-levels 4
;;              :html-extension "md"
;;              :with-section-numbers nil
;;              :table-of-contents nil
;;              ;; Only export section between <body> </body>
;;              :body-only t)))))


;; (use-package skewer-mode)

(use-package lsp-mode)

(use-package lsp-rust
  :config
  :init
  (with-eval-after-load 'lsp-mode
    (setq lsp-rust-rls-command '("rustup" "run" "stable" "rls"))
    (require 'lsp-rust)))

(use-package projectile
  :init
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  :config
  (projectile-mode +1))

(use-package yasnippet
  :init
  (setq yas-snippet-dirs
        '("~/.emacs.d/personal/snippets" "~/.emacs.d/personal/my_snippets/"))
  (yas-global-mode 1)
  (yas-reload-all))

(use-package helm-c-yasnippet)

;; (use-package wsd-mode
;;   :init (progn
;;           (require 'wsd-mode)
;;           (add-hook 'wsd-mode-hook 'company-mode)))

;; (use-package idle-highlight-mode
;;   :init (progn
;;           (idle-highlight-mode 1)))

;; (use-package flycheck-rust)


;; (use-package cargo)

;; (use-package racket-mode

;;   :init (progn (add-to-list 'auto-mode-alist '("\\.pp\\'" . racket-mode))))

(use-package dumb-jump)

;; (use-package webpaste
;;   :bind (("C-c C-p C-b" . webpaste-paste-buffer)
;;          ("C-c C-p C-r" . webpaste-paste-region)))

;; (use-package fill-column-indicator
;;   :init (progn
;;           (require 'fill-column-indicator)
;;           (setq fci-rule-column 80)
;;           (turn-on-fci-mode)))

(use-package prettier-js
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.js\\'" . prettier-js-mode)))
  :config
  (setq prettier-js-args '("--use-tabs" "false"
                           "--jsx-bracket-same-line" "true"
                           "--parser" "babylon"
                           "--print-width" "80"
                           "--trailing-comma" "none"
                           "--bracket-spacing" "false")))

(use-package rjsx-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode)))

(use-package zone
  :bind ("C-M-o" . zone))

(use-package highlight-symbol
  :bind ("<C-return>" . highlight-symbol))

(use-package hide-lines)

(defun setup-tide-mode ()
  (interactive)
  (setq tide-format-options
        '(:indentSize 2 :tabSize 2))
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M - x package - install[ret] company`
  (company-mode +1)
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))


;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; (use-package flycheck-joker
;;   :init (require 'flycheck-joker))

;; (use-package helm-org-rifle
;;   :init (require 'helm-org-rifle)
;;   :config (progn
;;             (defun cisco-org-rifle (p)
;;               "When called with prefix, searches dv/org as well"
;;               (interactive "P")
;;               (helm-org-rifle-files
;;                (if p
;;                    (append (file-expand-wildcards "~/dv/org/*.org")
;;                            (file-expand-wildcards "~/dv/cisco/*.org"))
;;                  (file-expand-wildcards "~/dv/cisco/*.org"))))
;;             (setq helm-org-rifle-show-path 't))
;;   :bind (("C-M-<return>" . cisco-org-rifle)))

;; (use-package web-mode
;;   :init
;;   (add-to-list 'auto-mode-alist '("\\.html?\\'" . html-mode))
;;   (add-to-list 'auto-mode-alist '("\\.js*\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.less\\'" . web-mode))
;;   :config
;;   (setq web-mode-enable-auto-pairing t)
;;   (setq web-mode-enable-auto-closing t)
;;   (setq web-mode-engine-detection t)
;;   (setq web-mode-enable-css-colorization t)
;;   (setq web-mode-code-indent-offset 2)
;;   (setq web-mode-markup-indent-offset 2)
;;   (setq web-mode-css-indent-offset 2)
;;   (setq-default indent-tabs-mode nil)
;;   (setq web-mode-content-types-alist
;;         '(("jsx"  . "\\.js[x]?\\'")))
;;   (setq web-mode-engines-alist
;;         '(("reactjs"  . "\\.js[x]?\\'"))))

;; (use-package helm-themes
;;   :config
;;   (require 'helm-config)
;;   (require 'helm-themes))

;; (use-package smartparens-mode
;;   :config
;;   (add-to-list 'auto-mode-alist '("\\.js\\'" . smartparens-mode)))

;; (use-package smartparens-global-mode)

(use-package git-link
  :config
  (add-to-list 'git-link-remote-alist
               '("github\\.threatbuild\\.com" git-link-github))
  (setq git-link-default-branch "master")
  (global-set-key (kbd "C-c g l") 'git-link))

;; end use-package

;; (defun helm-projectile-ag (&optional options)
;;   "Helm version of projectile-ag."
;;   (interactive
;;    (if current-prefix-arg (list (read-string "option: " "" 'helm-ag--extra-options-history))))
;;   (if (require 'helm-ag nil  'noerror)
;;       (if (projectile-project-p)
;;           (let ((helm-ag-command-option options)
;;                 (current-prefix-arg nil))
;;             (helm-do-ag (projectile-project-root) (car (projectile-parse-dirconfig-file))))
;;         (error "You're not in a project"))
;;     (error "helm-ag not available")))

(global-set-key (kbd "<C-return>") 'highlight-symbol)

(global-flycheck-mode -1)
(remove-hook 'prog-mode 'flycheck-mode)

;; ======================================================================
;; ============================== org-mode ==============================
;; ======================================================================

(setq org-agenda-files (file-expand-wildcards "~/dv/cisco/*.org"))
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "|" "DONE")))

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((tags-todo "+PRIORITY=\"A\"")
          (todo "IN-PROGRESS")
          (agenda "")
          (alltodo "")
          (todo "BLOCKED")))))

(setq org-capture-templates
      (quote
       (("w" "Work note" entry
         (file+headline "~/dv/cisco/todo.org" "Jot")
         "* %?\nEntered on %U\n %i\n %a")
        ("t" "Work todo" entry
         (file+headline "~/dv/cisco/todo.org" "Todos")
         "* TODO %?\nEntered on %U\n %i\n %a")
        ("c" "Personal todo" entry
         (file+headline "~/dv/org/todo.org" "Jot")
         "* %?\nEntered on %U\n %i\n %a")
        ("n" "Personal note" entry
         (file+headline "~/dv/org/notes.org" "Jot")
         "* %?\nEntered on %U\n %i\n %a")
        ("p" "Programming principle" entry
         (file+headline "~/dv/org/notes.org" "Principles")
         "* %?       :principle:\nEntered on %U\n %i\n %a :principle:"))))

(global-set-key (kbd "C-c c") 'org-capture)

(defun my-org-mode-prefs ()
  (progn
    (flycheck-mode -1)
    (whitespace-mode -1)
    (visual-line-mode 1)))

(add-hook 'org-mode-hook 'my-org-mode-prefs)

(global-hl-line-mode -1)

;; ======================================================================
;; ========================== end org-mode ==============================
;; ======================================================================
(defun work-notes ()
  (interactive)
  (progn (find-file "~/dv/cisco/notes.org")))

(defun todo ()
  (interactive)
  (progn (find-file "~/dv/cisco/todo.org")))

(defun my-notes ()
  (interactive)
  (progn (find-file "~/dv/org/notes.org")))

;; (defun diminish-all ()
;;   (interactive)
;;   (diminish 'which-key-mode "")
;;   (diminish 'prelude-mode "")
;;   (diminish 'auto-revert-mode "")
;;   (diminish 'smartparens-mode "")
;;   (diminish 'projectile-mode "")
;;   (diminish 'whitespace-newline-mode "")
;;   (diminish 'whitespace-mode "")
;;   (diminish 'global-whitespace-mode "")
;;   (diminish 'editorconfig-mode "")
;;   (diminish 'helm-mode "")
;;   (diminish 'company-mode "")
;;   (diminish 'clj-refactor-mode "")
;;   (diminish 'yas-minor-mode "")
;;   (diminish 'clj-refactor-mode "")
;;   (diminish 'org-cdlatex-mode "")
;;   (diminish 'beacon-mode "")
;;   (diminish 'guru-mode "")
;;   (diminish 'flycheck-mode "fc")
;;   (diminish 'cider-mode "cider")
;;   (diminish 'clj-refactor-mode "")
;;   (diminish 'yasnippet-mode "")
;;   (message "Minor modes Diminished."))

;; (diminish-all)


(setq vc-handled-backends nil)

(defun toggle-frame-split ()
  "If the frame is split vertically, split it horizontally or vice versa.
Assumes that the frame is only split into two."
              (interactive)
              (unless (= (length (window-list)) 2) (error "Can only toggle a frame split in two"))
              (let ((split-vertically-p (window-combined-p)))
                (delete-window) ; closes current window
                (if split-vertically-p
                    (split-window-horizontally)
                  (split-window-vertically)) ; gives us a split with the other window twice
                (switch-to-buffer nil))) ; restore the original window in this part of the frame

            ;; I don't use the default binding of 'C-x 5', so use toggle-frame-split instead
            (global-set-key (kbd "C-x C-|") 'toggle-frame-split)
