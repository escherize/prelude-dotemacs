;; use-package installation:
(eval-when-compile (require 'use-package))
(require 'diminish)
(require 'bind-key)
(message "use-package Installed!")

(use-package creamsody-theme
  :ensure t)

(use-package cyberpunk-theme
  :ensure t
  :disabled t)

(use-package multiple-cursors
  :ensure t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))
