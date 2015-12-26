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


;; handle this by-hand
;;(add-to-list 'prelude-packages 'clj-refactor)
(add-to-list 'prelude-packages 'emmet-mode)
(add-to-list 'prelude-packages 'wsd-mode)
(add-to-list 'prelude-packages 'github-browse-file)
(add-to-list 'prelude-packages 'guide-key)
(add-to-list 'prelude-packages 'neotree)
(add-to-list 'prelude-packages 'align-cljlet)
;;(add-to-list 'prelude-packages 'moe-theme)
(add-to-list 'prelude-packages 'spacemacs-theme)
(add-to-list 'prelude-packages 'spaceline)
(add-to-list 'prelude-packages 'highlight-symbol)
(add-to-list 'prelude-packages 'edit-server)
;;(add-to-list 'prelude-packages 'nyan-mode)
(add-to-list 'prelude-packages 'eyebrowse)
(add-to-list 'prelude-packages 'fill-column-indicator)
(add-to-list 'prelude-packages 'beacon)
(add-to-list 'prelude-packages 'highlight-tail)

(prelude-install-packages)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  END use prelude to auto-install
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Highlight Tail mode - Kewl~
(setq highlight-tail-colors '(("black" . 0)
                              ("#bc2525" . 25)
                              ("black" . 66)))
(setq highlight-tail-steps 10 highlight-tail-timer 1)
(setq highlight-tail-posterior-type 'const)
;; (highlight-tail-reload)
(highlight-tail-mode)

;;; Apples and stuff

;; Then there's this which is
;; boot stuff
(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
(add-to-list 'magic-mode-alist '(".* boot" . clojure-mode))

(require 'clj-refactor)

(smartparens-global-strict-mode t)

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

(beacon-mode)

(custom-set-variables
 '(undo-tree-visualizer-show-diff t)
 '(undo-tree-visualizer-timestamps t))

(require 'fill-column-indicator)
(setq fci-rule-column 80)
(turn-on-fci-mode)

(require 'eyebrowse)
(eyebrowse-mode t)

(require 'edit-server) ;; needed for chrome Edit with Emacs
(edit-server-start)

(require 'spaceline-config)
(spaceline-spacemacs-theme)
(load-theme 'spacemacs-dark)

;;;; spaceline =medium= settings

;;; integrates with eyebrowse.
(spaceline-toggle-workspace-number-on)
;;; integrates with window-numbering.
(spaceline-toggle-window-number-off)
;;; shows the current evil state, integrates with evil.
(spaceline-toggle-evil-state-off)
;;; integrates with anzu.
(spaceline-toggle-anzu-off)
;;; the standard marker denoting whether the buffer is modified or not.
(spaceline-toggle-buffer-modified-on)
;;; the size of the buffer.
(spaceline-toggle-buffer-size-off)
;;; the name of the buffer.
(spaceline-toggle-buffer-id-on)
;;; the host for remote buffers.
(spaceline-toggle-remote-host-off)
;;; the current major mode.
(spaceline-toggle-major-mode-on)
;;; number of flycheck errors, integrates with flyche(spaceline-toggle-ck)
(spaceline-toggle-flycheck-error-off)
;;; number of flycheck warnings, integrates with flycheck.
(spaceline-toggle-flycheck-warning-off)
;;; number of flycheck notifications, integrates with flycheck.
(spaceline-toggle-flycheck-info-off)
;;; the currently enabled minor modes. The output of this segment can be tweaked with diminish.
(spaceline-toggle-minor-modes-on)
;;; the background process associated with the buffer, if any.
(spaceline-toggle-process-off)
;;; IRC channels with new messages, integrates with erc.
(spaceline-toggle-erc-track-off)
;;; version control information.
(spaceline-toggle-version-control-on)
;;; integrates with org-pomodoro.
(spaceline-toggle-org-pomodoro-off)
;;; the current org clock, integrates with org.
(spaceline-toggle-org-clock-off)
;;; integrates with nyan-mode.
(spaceline-toggle-nyan-cat-off)
;;; shows the currently visible part of the buffer.
;; Usually either this or nyancat.
(spaceline-toggle-hud-on)
;;; integrates with fancy-battery-mode.
(spaceline-toggle-battery-off)
;;; information about the currently active selection, if any.
(spaceline-toggle-selection-info-off)
;;; the line ending convention used in the current buffer (unix, dos or mac).
(spaceline-toggle-buffer-encoding-abbrev-off)
;;; the value of point, this is disabled by default.
(spaceline-toggle-point-position-off)
;;; current line and column.
(spaceline-toggle-line-column-on)
;;; meta-segment used by third-party packages.
(spaceline-toggle-global-on)
;;; shows the current position in the buffer as a percentage.
(spaceline-toggle-buffer-position-off)


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
                               (define-key clojure-mode-map (kbd "C-c C-w") nil)
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-m")
                               (local-set-key (kbd ";") 'sp-comment)))

(add-hook 'cider-mode-map
          (lambda ()
            (define-key cider-mode-map (kbd "C-c C-w") nil)))

(defun save-macro (name)
  "save a macro. Take a name as argument
   and save the last defined macro under
   this name at the end of your .emacs"
  (interactive "SName of the macro: ")
  (kmacro-name-last-macro name)
  (find-file "~/.emacs.d/core.el") ;; user-init-file
  (goto-char (point-max))
  (newline)
  (insert-kbd-macro name)
  (newline)
  (switch-to-buffer nil))

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

(defun figwheel-repl ()
  "Use call this when connecting to a figwheel repl.
Source is over at: http://yogthos.net/posts/2015-06-16-Figwheel-nREPL.html"
  (interactive)
  (insert "(use 'figwheel-sidecar.repl-api)
(cljs-repl)
"))

(defun diminish-custom ()
  "Diminish the modes that are always on."
  (interactive)
  (diminish 'guru-mode)
  (diminish 'guide-key-mode)
  (diminish 'flycheck-mode)
  (diminish 'helm-mode)
  (diminish 'whitespace-mode)
  (diminish 'projectile-mode)
  (diminish 'prelude-mode))

;;;; diminish modes that are always on.
(run-at-time "3 sec" nil 'diminish-custom)

(provide 'personal)
;;; personal.el ends here
