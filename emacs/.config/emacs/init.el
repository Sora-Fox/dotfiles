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

(set-face-attribute 'default nil :font "Source Code Pro" :height 160)
(setopt display-line-numbers-type 'relative)

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

(global-set-key (kbd "C-x ;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x C-g") 'recentf-open-files)
(global-set-key (kbd "C-x RET") 'project-compile)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook (lambda () (setq truncate-lines t)))

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

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-position-line-format '("%l"))
  (doom-modeline-total-line-number t)
  (doom-modeline-percent-position nil)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-icon nil))

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package vertico
  :config (vertico-mode))

(use-package marginalia
  :config (marginalia-mode))

(use-package tree-sitter
  :hook ((c++-mode . tree-sitter-hl-mode)
	 (c-mode . tree-sitter-hl-mode))
  :config (global-tree-sitter-mode))

(use-package tree-sitter-langs)

(use-package vterm
  :bind ("C-c t" . vterm-other-window))

(use-package flycheck
  :config (global-flycheck-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package lsp-mode
  :custom (lsp-keymap-prefix "C-l")
  :hook ((c++-mode . lsp-deferred)
         (c-mode . lsp-deferred)
	 (before-save . lsp-format-buffer)))

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
