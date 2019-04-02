(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-dispatch-when-more-than 5)
 '(clojure-indent-style :always-align)
 '(clojure-omit-space-between-tag-and-delimiters (quote (91 123 40 34)))
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(crux-indent-sensitive-modes
   (quote
    (js2-mode conf-mode coffee-mode haml-mode python-mode slim-mode yaml-mode)))
 '(custom-safe-themes
   (quote
    ("13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "190a9882bef28d7e944aa610aa68fe1ee34ecea6127239178c7ac848754992df" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "6de7c03d614033c0403657409313d5f01202361e35490a3404e33e46663c2596" "ed317c0a3387be628a48c4bbdb316b4fa645a414838149069210b66dd521733f" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(dumb-jump-aggressive t)
 '(dumb-jump-mode t)
 '(dumb-jump-prefer-searcher (quote rg))
 '(dumb-jump-selector (quote helm))
 '(expand-region-preferred-python-mode (quote fgallina-python))
 '(fci-rule-color "#383838")
 '(helm-ag-base-command "rg-wrapper --vimgrep --no-heading --smart-case")
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
 '(indent-tabs-mode nil)
 '(jedi:install-python-jedi-dev-command
   (quote
    ("pip3" "install" "--upgrade" "git+https://github.com/davidhalter/jedi.git@dev#egg=jedi")))
 '(magit-branch-arguments nil)
 '(mc/always-run-for-all t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(nxml-child-indent 4)
 '(org-agenda-files (quote ("/Users/brmaass/dv/cisco/notes.org")))
 '(org-export-with-toc nil)
 '(org-from-is-user-regexp "\\<bryan maass\\>")
 '(org-hide-leading-stars t)
 '(org-log-done (quote time))
 '(org-startup-folded nil)
 '(package-selected-packages
   (quote
    (fennel-mode ac-cider hide-lines smartparens-global-mode smartparens-mode js2-refactor golden-ratio org2jekyll zprint-mode sesman cider typing lsp-javascript-typescript lsp-typescript typescript-mode company-lsp lsp-rust clj-refactor mustache mustache-mode jedi company-tern tern flymake-jslint doom-themes solarized-theme moe-theme monokai-theme helm-emmet company-web helm-c-yasnippet yasnippet-snippets react-snippets helm-ag skewer-mode evil-commentary evil-tutor evil auto-yasnippet tide rjsx-mode git-link org-brain helm-clojuredocs git-gutter-fringe+ powerline applescript-mode ample-theme helm-themes helm-org-rifle :init org-plus-contrib org-mode flycheck-joker restclient-helm lorem-ipsum highlight-symbol inf-clojure lua-mode rg projectile-ripgrep company-restclient restclient less-css-mode ido-completing-read+ avy prettier-js github-browse-file emmet-mode clojure-mode yasnippet yaml-mode plantuml-mode smbc fill-column-indicator elm-mode webpaste apples-mode dumb-jump rust-mode multiple-cursors dracula-theme anaconda-mode coffee-mode helm zop-to-char zenburn-theme wsd-mode which-key volatile-highlights vkill undo-tree smex smartrep smartparens smart-mode-line rainbow-mode rainbow-delimiters racket-mode racer puppet-mode projectile ox-reveal ov operate-on-number move-text markdown-mode magit linum-relative json-mode js2-mode imenu-anywhere ido-ubiquitous idle-highlight-mode htmlize highlight-parentheses guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist geiser flymake-json flycheck-rust flycheck-clojure flx-ido expand-region exec-path-from-shell elpy elisp-slime-nav editorconfig easy-kill dockerfile-mode discover-my-major diff-hl cyberpunk-theme csv-mode crux color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cargo browse-kill-ring beacon anzu ace-window 2048-game)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(projectile-keymap-prefix (kbd "C-c p"))
 '(projectile-mode t nil (projectile))
 '(projectile-switch-project-action (quote helm-projectile-find-file))
 '(python-shell-interpreter "python3")
 '(recenter-positions (quote (middle 0.05 0.93)))
 '(safe-local-variable-values
   (quote
    ((flycheck-checker . jsx-tide)
     (eval progn
           (add-to-list
            (quote grep-find-ignored-directories)
            "tg-mask/resources")
           (add-to-list
            (quote exec-path)
            (concat
             (locate-dominating-file default-directory ".dir-locals.el")
             "node_modules/.bin/")))
     (clojure-indent-style . 0))))
 '(tab-always-indent (quote complete))
 '(tab-width 2)
 '(tide-format-options "None")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
