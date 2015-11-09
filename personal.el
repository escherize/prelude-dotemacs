;;; personal.el -- personal settings for Emacs prelude

;;; Commentary:

;;; Code:
;; These are some personal settings that I find
;; _Extremely_ nessicary, and some personal functions.

(setq inhibit-splash-screen 1)        ;; no splash screen, thanks
(line-number-mode 1)                  ;; have line numbers and
(column-number-mode 1)                ;; column numbers in the mode line
(tool-bar-mode -1)                    ;; no tool bar with icons
(scroll-bar-mode -1)                  ;; no scroll bars
(global-linum-mode 1)                 ;; add line numbers on the left
(setq select-enable-clipboard 1)      ;; Use the system clipboard
(global-auto-revert-mode 1)           ;; pickup external file changes (i.e. git)
(setq-default sh-basic-offset 2)      ;; shell
(setq-default sh-indentation 2)       ;; shell indentation
(setq-default tab-width 2)            ;; Tab width of 2
(fset 'yes-or-no-p 'y-or-n-p)         ;; enable y/n answers
(setq initial-scratch-message "")     ;; empty scratch message
(setq ring-bell-function
      (lambda () (message "*beep*"))) ;; dont beep outloud, thats rude.
(setq auto-window-vscroll nil)        ;; better scrolling
(global-hl-line-mode 1)               ;; do highlight line at point
(setq prelude-flyspell nil)           ;; no more red boxes

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Navigate windows with shift-<arrows>
(windmove-default-keybindings 'shift)
(setq windmove-wrap-around nil)

;; Helm settings:
(helm-autoresize-mode 1)

;; on mac, there's always a menu bar drawn, don't have it empty
(unless (string-match "apple-darwin" system-configuration)
  (menu-bar-mode -1))

;; under mac, have Command as Super and Alt as Meta
(when (string-match "apple-darwin" system-configuration)
  (setq mac-allow-anti-aliasing 1)
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta))

;; Save here instead of littering current directory with emacs backup files
(setq backup-directory-alist `(("." . "~/.saves")))


;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)


;; multiple cursor mode defaults.

(defun stand ()
  (interactive)
  (find-file
   (concat "~/notes/standup"
           (format-time-string "%Y-%m-%d")
           ".org")))

(defun fetchh-notes ()
  (interactive)
  (find-file "~/notes/fetchh.org"))

(defun todo ()
  (interactive)
  (find-file "~/fetchh/fetchh_sync/todo/bryan.md"))

(global-set-key [f9] 'todo)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Needed installation.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; use prelude to auto-install whatever the fuck packages I want.

(smartparens-global-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  use prelude to auto-install whatever the fuck packages I want.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'prelude-packages 'clj-refactor)
(add-to-list 'prelude-packages 'emmet-mode)
(add-to-list 'prelude-packages 'wsd-mode)
(add-to-list 'prelude-packages 'github-browse-file)
(add-to-list 'prelude-packages 'guide-key)
(add-to-list 'prelude-packages 'neotree)
(add-to-list 'prelude-packages 'align-cljlet)
(add-to-list 'prelude-packages 'moe-theme)
(add-to-list 'prelude-packages 'spaceline)
(add-to-list 'prelude-packages 'highlight-symbol)
(add-to-list 'prelude-packages 'perspective)

(prelude-install-packages)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  END use prelude to auto-install
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'perspective)
(global-set-key (kbd "s-}") 'persp-next)
(global-set-key (kbd "s-{") 'persp-prev)

(require 'spaceline-config)
(spaceline-spacemacs-theme)
(load-theme 'spacemacs-dark)


(require'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c" "C-h" "C-x x"))
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/idle-delay 1.0)
(guide-key-mode 1)  ; Enable guide-key-mode

;; Auto-start emmet on 'any markup' modes
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)
(setq emmet-preview-default t)

(setq helm-display-header-line nil) ;; t by default
(set-face-attribute 'helm-source-header nil :height 0.1)
(setq helm-split-window-in-side-p 't)

;; set clj + clj refactor mode on clojure files
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edn\\'" . clojure-mode))

(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-m")
                               (local-set-key (kbd ";") 'sp-comment)))

(global-set-key (kbd "C-c h s") 'helm-do-ag)

(global-set-key (kbd "<C-return>") 'highlight-symbol)

(setq magit-last-seen-setup-instructions "1.4.0")

(defun my-python-config ()
  "Modify keymaps used by `python-mode'."
  (local-set-key (kbd "M .") 'jedi:goto-definition)
  (local-set-key (kbd "M ,") 'jedi:goto-definition-pop-marker))
(add-hook 'python-mode-hook 'my-python-config)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(elpy-enable)

(global-set-key (kbd "C-c j") 'avy-goto-subword-1)
;;(global-set-key (kbd "s-w") 'ace-window)

(persp-mode 1)

(defun figwheel-repl ()
  "Use call this when connecting to a figwheel repl.
Source is over at: http://yogthos.net/posts/2015-06-16-Figwheel-nREPL.html"
  (interactive)
  (insert "(use 'figwheel-sidecar.repl-api)
(cljs-repl)
"))

(provide 'personal)
;;; personal.el ends here
