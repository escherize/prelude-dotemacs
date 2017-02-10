;; use-package installation:
(eval-when-compile (require 'use-package))
(require 'diminish)
(require 'bind-key)
(message "use-package Installed!")

;; melpa stable installation:
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)


(use-package color-theme-sanityinc-solarized :ensure t :disabled t
  :init (load-theme 'sanityinc-solarized-dark))

(use-package color-theme-sanityinc-tomorrow :ensure t :disabled t)

(use-package cyberpunk-theme :ensure t :disabled t)
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
    ;; limit max number of matches displayed for speed
    (setq helm-candidate-number-limit 100)
    ;; ignore boring files like .o and .a
    (setq helm-ff-skip-boring-files t))
  :bind (("C-x f" . helm-for-files)))

(use-package cider
  :ensure t
  :pin melpa-stable)
