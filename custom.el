(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cljr-favor-prefix-notation t)
 '(clojure-indent-style :align-arguments)
 '(clojure-omit-space-between-tag-and-delimiters (quote (91 123 40 34)))
 '(custom-safe-themes
   (quote
    ("6de7c03d614033c0403657409313d5f01202361e35490a3404e33e46663c2596" "ed317c0a3387be628a48c4bbdb316b4fa645a414838149069210b66dd521733f" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(dumb-jump-mode t)
 '(helm-ag-base-command "rg --no-heading")
 '(helm-ag-command-option nil)
 '(helm-ag-insert-at-point (quote symbol))
 '(helm-ag-use-temp-buffer t)
 '(helm-buffers-fuzzy-matching t)
 '(helm-descbinds-mode t)
 '(helm-ff-file-name-history-use-recentf t)
 '(helm-ff-search-library-in-sexp t)
 '(helm-ff-skip-boring-files t)
 '(helm-grep-ignored-files
   (quote
    (".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "*figwheel_server.log")))
 '(helm-mode t)
 '(helm-move-to-line-cycle-in-source t)
 '(helm-net-prefer-curl t)
 '(helm-split-window-inside-p t)
 '(magit-branch-arguments nil)
 '(mc/always-run-for-all t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files (quote ("/Users/brmaass/dv/cisco/notes.org")))
 '(org-capture-templates
   (quote
    (("c" "Work TODO Task" entry
      (file "~/dv/cisco/todo.org")
      "* TODO %?"))) t)
 '(org-export-with-toc nil)
 '(org-from-is-user-regexp "\\<bryan maass\\>")
 '(org-hide-leading-stars t)
 '(org-log-done (quote time))
 '(org-startup-folded nil)
 '(package-selected-packages
   (quote
    (helm-rg lsp-ui company-lsp counsel swiper python-environment pythonic pyvenv request rich-minority s typescript-mode with-editor git-link zprint-mode tide helm-emmet rjsx-mode cider jedi moe-theme powerline applescript-mode ample-theme helm-themes helm-org-rifle :init org-plus-contrib org-mode flycheck-joker restclient-helm lorem-ipsum highlight-symbol inf-clojure lua-mode rg projectile-ripgrep company-restclient restclient less-css-mode ido-completing-read+ avy prettier-js github-browse-file emmet-mode clj-refactor clojure-mode yasnippet yaml-mode plantuml-mode smbc fill-column-indicator elm-mode webpaste apples-mode dumb-jump rust-mode multiple-cursors dracula-theme anaconda-mode coffee-mode helm zop-to-char zenburn-theme wsd-mode which-key volatile-highlights vkill use-package undo-tree smex smartrep smartparens smart-mode-line rainbow-mode rainbow-delimiters racket-mode racer puppet-mode projectile ox-reveal ov operate-on-number move-text markdown-mode magit linum-relative json-mode js2-mode imenu-anywhere ido-ubiquitous idle-highlight-mode htmlize highlight-parentheses guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist geiser flymake-json flycheck-rust flycheck-clojure flx-ido expand-region exec-path-from-shell elpy elisp-slime-nav editorconfig easy-kill dockerfile-mode discover-my-major diff-hl cyberpunk-theme csv-mode crux color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cargo browse-kill-ring beacon anzu ace-window 2048-game)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(recenter-positions (quote (middle 0.05 0.93)))
 '(safe-local-variable-values
   (quote
    ((cljr-favor-prefix-notation)
     (cljr-auto-clean-ns . t)
     (bug-reference-bug-regexp . "#\\(?2:[[:digit:]]+\\)")
     (checkdoc-package-keywords-flag))))
 '(tab-width 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(zprint-hang t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
