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
      (lambda () (message "*beep*"))) ;; dont beep outloud, thats rude!
(setq auto-window-vscroll nil)        ;; better scrolling
(global-hl-line-mode 0)               ;; do not highlight line at point
(setq prelude-flyspell nil)           ;; no more red boxes

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Navigate windows with shift-<arrows>
(windmove-default-keybindings 'shift)
(setq windmove-wrap-around nil)

;; reverse regex thing:
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Helm settings:
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)

(when (executable-find "curl") (setq helm-net-prefer-curl t))

(define-globalized-minor-mode
  global-text-scale-mode
  text-scale-mode
  (lambda () (text-scale-mode 1)))

(defun global-text-scale-adjust (inc)
  (interactive)
  (text-scale-set 1)
  (kill-local-variable 'text-scale-mode-amount)
  (setq-default text-scale-mode-amount (+ text-scale-mode-amount inc))
  (global-text-scale-mode 1))

(defun big-mode ()
  (interactive)
  (text-scale-set 1)
  (global-text-scale-adjust 1))

(defun lil-mode ()
  (interactive)
  (text-scale-set 1)
  (global-text-scale-adjust -1))

(setq
 ;; open helm buffer inside current window, not occupy whole other window
 helm-split-window-in-side-p           t

 ;; move to end or beginning of source when reaching top or bottom of source.
 helm-move-to-line-cycle-in-source     t

 ;; search for library in `require' and `declare-function' sexp.
 helm-ff-search-library-in-sexp        t

 ;; scroll 8 lines other window using M-<next>/M-<prior>
 helm-scroll-amount                    8
 helm-ff-file-name-history-use-recentf t
 helm-display-header-line              t
 helm-split-window-in-side-p           t)

(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))
(helm-autoresize-mode 1)
(set-face-attribute 'helm-source-header nil :height 0.1)

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

(defun notes ()
  (interactive)
  (find-file
   (concat "~/notes/random"
           (format-time-string "%Y-%m-%d")
           ".org")))

(defun fetchh-notes  ()
  (interactive)
  (find-file "~/dv/notes/fetchh.org"))

(defun todo ()
  (interactive)
  (find-file "~/fetchh/fetchh_sync/todo/bryan.md"))

(global-set-key [f9] 'notes)

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
(add-to-list 'prelude-packages 'spacemacs-theme)
(add-to-list 'prelude-packages 'solarized-theme)
(add-to-list 'prelude-packages 'spaceline)
(add-to-list 'prelude-packages 'highlight-symbol)
(add-to-list 'prelude-packages 'edit-server)

(add-to-list 'prelude-packages 'nyan-mode)
(add-to-list 'prelude-packages 'eyebrowse)
(add-to-list 'prelude-packages 'fill-column-indicator)
(add-to-list 'prelude-packages 'beacon)
(add-to-list 'prelude-packages 'highlight-tail)
(add-to-list 'prelude-packages 'ox-reveal)
;; (add-to-list 'prelude-packages 'powerline)

(prelude-install-packages)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  END use prelude to auto-install
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Apples and stuff



;; (require 'powerline)

;; (require 'moe-theme)

;; ;; Show highlighted buffer-id as decoration. (Default: nil)
;; (setq moe-theme-highlight-buffer-id t)

;; ;; Resize titles (optional).
;; (setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
;; (setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
;; (setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))

;; ;; Choose a color for mode-line.(Default: blue)
;; (moe-theme-set-color 'cyan)
;; (moe-dark)
;; (powerline-moe-theme)

(require 'ox-reveal)

(setq org-reveal-root "./reveal.js")
;;(setq org-reveal-root "file:///Users/bcm/dv/reveal/reveal.js-3.2.0")

;; Then there's this which is
;; boot stuff
(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
(add-to-list 'magic-mode-alist '(".* boot" . clojure-mode))

(require 'clj-refactor)

(smartparens-global-strict-mode t)

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import
  ;; this does C-c C-ret, so: ???
  (cljr-add-keybindings-with-prefix "C-c C-m")
  (progn (defun clojure-test-filename ()
           (concat (projectile-project-root)
                   "test/clj"
                   (mapconcat #'identity
                              (butlast (split-string (cider-current-ns) "\\.")) "/")
                   "/"
                   (file-name-nondirectory (file-name-sans-extension (buffer-file-name)))
                   "_test.clj"))

         (defadvice projectile-toggle-between-implementation-and-test (around create-clojure-test-advice)
           "Visit new file if can't find test"
           (condition-case nil
               ad-do-it
             (error (find-file (clojure-test-filename)))))

         (ad-activate 'projectile-toggle-between-implementation-and-test))
  (define-clojure-indent
    (defroutes 'defun)
    (GET 2)
    (POST 2)
    (PUT 2)
    (DELETE 2)
    (HEAD 2)
    (ANY 2)
    (context 2)
    (defapi 2)))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

(beacon-mode 1)

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
;;(load-theme 'dracula)
(load-theme 'spacemacs-dark)
;;(load-theme 'solarized-dark)
(spaceline-emacs-theme)
(spaceline-spacemacs-theme)


(nyan-mode 1)
(nyan-toggle-wavy-trail)
(nyan-start-animation)

;;;;;;;;;;;;;;;;;;;;;;;;;; spaceline settings ;;;;;;;;;;;;;;;;;;;;;;;;;;
(spaceline-toggle-workspace-number-on)        ;;; integrates with eyebrowse.
(spaceline-toggle-window-number-off)          ;;; integrates with window-numbering.
(spaceline-toggle-evil-state-off)             ;;; shows the current evil state, integrates with evil.
(spaceline-toggle-anzu-on)                    ;;; integrates with anzu.
(spaceline-toggle-buffer-modified-on)         ;;; the standard marker denoting whether the buffer is modified or not.
(spaceline-toggle-buffer-size-off)            ;;; the size of the buffer.
(spaceline-toggle-buffer-id-on)               ;;; the name of the buffer.
(spaceline-toggle-remote-host-off)            ;;; the host for remote buffers.
(spaceline-toggle-major-mode-on)              ;;; the current major mode.
(spaceline-toggle-flycheck-error-off)         ;;; number of flycheck errors, integrates with flyche(spaceline-toggle-ck)
(spaceline-toggle-flycheck-warning-off)       ;;; number of flycheck warnings, integrates with flycheck.
(spaceline-toggle-flycheck-info-off)          ;;; number of flycheck notifications, integrates with flycheck.
(spaceline-toggle-minor-modes-off)            ;;; The output of this segment can be tweaked with diminish.
(spaceline-toggle-process-off)                ;;; the background process associated with the buffer, if any.
(spaceline-toggle-erc-track-off)              ;;; IRC channels with new messages, integrates with erc.
(spaceline-toggle-version-control-off)        ;;; version control information.
(spaceline-toggle-org-pomodoro-off)           ;;; integrates with org-pomodoro.
(spaceline-toggle-org-clock-off)              ;;; the current org clock, integrates with org.
(spaceline-toggle-nyan-cat-on)               ;;; integrates with nyan-mode.
(spaceline-toggle-hud-on)                     ;;; shows the currently visible part of the buffer.
(spaceline-toggle-battery-off)                ;;; show battery thing fancy battery
(spaceline-toggle-selection-info-off)         ;;; information about the currently active selection, if any.
(spaceline-toggle-buffer-encoding-abbrev-off) ;;; the line ending convention used in the current buffer (unix, dos or mac).
(spaceline-toggle-point-position-off)         ;;; the value of point, this is disabled by default.
(spaceline-toggle-line-column-on)             ;;; current line and column.
(spaceline-toggle-global-on)                  ;;; meta-segment used by third-party packages.
(spaceline-toggle-buffer-position-off)        ;;; shows the current position in the buffer as a percentage.
(spaceline-toggle-buffer-id-on)               ;;; names of buffers
(spaceline-toggle-which-function-off)         ;;; annoying broken thing.



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
            (eldoc-mode 1)
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


(global-set-key (kbd "C-c j") 'avy-goto-subword-1)
;;(global-set-key (kbd "s-w") 'ace-window)

(defun diminish-custom ()
  "Diminish the modes that are most-always on."
  (interactive)
  (diminish 'company)
  (diminish 'guru-mode)
  (diminish 'guide-key-mode)
  (diminish 'flycheck-mode)
  (diminish 'helm-mode)
  (diminish 'whitespace-mode)
  (diminish 'projectile-mode)
  (diminish 'prelude-mode)
  (diminish 'yas-minor-mode))
;;;; diminish modes that are always on.
(run-at-time "3 sec" nil 'diminish-custom)

(defun transparency (value)
  "VALUE set the transparency of the frame window!
0=transparent/100=opaque"
  (interactive "Transparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(set-frame-parameter (selected-frame) 'alpha '(100 100))
(add-to-list 'default-frame-alist '(alpha 100 100))

(global-set-key (kbd "C-z") nil)     ;; overwrite suspend-frame.
(global-set-key (kbd "C-x C-z") nil) ;; overwrite suspend-frame.

(setq org-publish-project-alist
      '(("escherize"
         :components ("org-escherize" ;;"org-static-escherize"
                      ))

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
         :body-only t)

        ;; ("org-static-escherize"
        ;;  :publishing-directory "~/dv/escherize-blog/"
        ;;  :base-directory "~/dv/escherize-blog/_drafts/"
        ;;  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
        ;;  :recursive t
        ;;  :publishing-function org-publish-attachment)

        ))

(guide-key-mode 0)

(server-start)

(provide 'personal)
;;; personal.el ends here
