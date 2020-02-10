(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

;; ===========================================
;;   PUT THE PACKAGE WE WANT TO INSTALL HERE
;; ===========================================

;; For CMake
(use-package cmake-mode)

;; For Markdown
(use-package markdown-mode)

;; For magit
(use-package magit)

;; Emacs theme
(use-package doom-themes)
;; Load theme zenburn
(load-theme 'doom-tomorrow-night t)

;; For parenthesis
(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(show-paren-mode 1)

;; neotree --sidebar for project file navigation
(use-package neotree
  :config (global-set-key "\C-x\ d" 'neotree-toggle))
(neotree-refresh)
(neotree-toggle)

(use-package ivy
  :custom
  (ivy-use-selectable-prompt t)
  :config
  (ivy-mode t))
