;;; personal.el -- personal settings for Emacs prelude

;;; Commentary:

;;; Code:
;; These are some personal settings that I find
;; _Extremely_ nessicary, and some personal functions.

(setq inhibit-splash-screen 1)          ; no splash screen, thanks
(line-number-mode 1)                    ; have line numbers and
(column-number-mode 1)                  ; column numbers in the mode line
(tool-bar-mode -1)                      ; no tool bar with icons
(scroll-bar-mode -1)                    ; no scroll bars
(global-linum-mode 1)                   ; add line numbers on the left
(setq x-select-enable-clipboard 1)      ; Use the system clipboard
(global-auto-revert-mode 1)             ; pickup external file changes (i.e. git)
(setq-default sh-basic-offset 2)        ; shell
(setq-default sh-indentation 2)         ; shell indentation
(setq-default tab-width 2)              ; Tab width of 2
(fset 'yes-or-no-p 'y-or-n-p)           ; enable y/n answers
(setq initial-scratch-message "")       ; empty scratch message
(setq ring-bell-function
      (lambda () (message "*beep*")))   ; dont beep outloud, thats rude.
(setq auto-window-vscroll nil)          ; better scrolling
(global-hl-line-mode -1)                ; do not highlight line at point

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Navigate windows with shift-<arrows>
(windmove-default-keybindings 'shift)
(setq windmove-wrap-around -1)

;; Helm settings:
(helm-autoresize-mode 1)
(global-set-key (kbd "C-c C-s") 'helm-occur)


(unless (string-match "apple-darwin" system-configuration)
  ;; on mac, there's always a menu bar drawn, don't have it empty
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

(defun save-macro (name)
  ;; Save a macro.
;; Take a name as argument
;; and save the last defined macro under
;; this name at the end of your user.el
  (interactive "Same of the macro: ")
  (kmacro-name-last-macro name)
  (find-file "~/.emacs.d/personal/saved-macros.el") ;; user-init-file
  (goto-char (point-max))
  (newline)
  (insert-kbd-macro name)
  (newline)
  (switch-to-buffer nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start package.el downloader from
;; http://wikemacs.org/index.php/Package.el#Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)

(defvar my-packages
  '(clj-refactor)
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (package-refresh-contents)
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End package.el downloader -- packages all installed.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; set clj + clj refactor mode on clojure files
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edn\\'" . clojure-mode))

(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-m")))




(provide 'personal)
;;; personal.el ends here
