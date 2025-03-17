;;; ~/.config/emacs/init.el --- emacs config -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(blink-cursor-mode -1)
(recentf-mode 1)
(savehist-mode 1)
(column-number-mode 1)

;; (setq-default mode-line-format (list ""
;;     'mode-line-modified
;;     " "
;;     'mode-line-buffer-identification
;;     " "
;;     '(line-number-mode "%l")
;;     '(column-number-mode ":%c")
;;     'vc-mode
;;     '(:eval evil-mode-line-tag)
;;     'mode-line-format-right-align
;;     'flycheck-mode-line
;;     " "
;;     'mode-name
;;     " "
;;     'mode-line-end-spaces))

(when (find-font (font-spec :name "Source Code Pro"))
  (set-face-attribute 'default nil :font "Source Code Pro" :height 160))
(setopt display-line-numbers-type 'relative)
(global-set-key (kbd "C-x C-g") 'recentf-open-files)

(setq compile-command "bear -- make -j$(nproc)"
      frame-title-format "Emacs"
      make-backup-files nil
      inhibit-startup-message t
      initial-scratch-message nil
      split-width-threshold 0
      split-height-threshold nil
      scroll-step 1
      scroll-margin 15
      scroll-conservatively 10000)

(defun my-prog-mode-settings ()
  "Apply custom settings for programming modes."
  (display-line-numbers-mode 1)
  (hs-minor-mode 1)
  (setq truncate-lines t)
  (local-set-key (kbd "C-x ;") 'comment-or-uncomment-region)
  (local-set-key (kbd "C-x RET") 'project-compile)
  (local-set-key (kbd "C-c RET") 'hs-toggle-hiding))

(add-hook 'prog-mode-hook #'my-prog-mode-settings)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")
                         ("elpa"  . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
        (package-refresh-contents)
        (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package ansi-color
  :hook (compilation-filter . ansi-color-compilation-filter))

(use-package doom-themes
  :demand t
  :config (load-theme 'doom-material-dark t))

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package rainbow-mode
  :hook (prog-mode . rainbow-mode))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-vcs-max-length 20)
  (doom-modeline-bar-width -1)
  (doom-modeline-position-line-format '("%l"))
  (doom-modeline-total-line-number t)
  (doom-modeline-percent-position nil)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-icon nil))

(use-package dashboard
  :config
  (setq dashboard-items '((projects  . 9))
        initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))
  (dashboard-setup-startup-hook))

(use-package vertico
  :config (vertico-mode))

(use-package marginalia
  :config (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package tree-sitter
  :hook ((c++-mode . tree-sitter-hl-mode)
	 (c-mode . tree-sitter-hl-mode))
  :config (global-tree-sitter-mode))

(use-package tree-sitter-langs)

(use-package vterm
  :bind ("C-c t" . vterm-other-window))

(use-package flycheck
  :config (global-flycheck-mode))

(use-package lsp-mode
  :custom
  (lsp-keymap-prefix "C-l")
  (lsp-headerline-breadcrumb-enable nil)
  :hook ((c++-mode . lsp-deferred)
         (c-mode . lsp-deferred)
	 (before-save . lsp-format-buffer)))

(use-package ccls
  :custom (ccls-executable "ccls"))

(use-package company
  :hook (prog-mode . company-mode)
  :config (setq company-minimum-prefix-length 1
                company-idle-delay 0.01))

(use-package evil
  :init (setq evil-want-integration t
              evil-want-keybinding nil)
  :config (evil-mode))

(use-package evil-collection
  :after evil
  :config (evil-collection-init))

(use-package key-chord
  :after evil
  :config
  (key-chord-mode)
  (setq key-chord-one-key-delay 0.5)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state))

(provide 'init)
;;; init.el ends here
