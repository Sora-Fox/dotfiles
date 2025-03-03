;;; ~/.config/emacs/init.el --- config -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;; ======================================================================
;;;                             Interface setup
;;; ======================================================================
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(blink-cursor-mode -1)
(recentf-mode 1)

(set-face-attribute 'default nil :font "Source Code Pro" :height 160)
(custom-set-variables '(display-line-numbers-type 'relative))

(setq compile-command "bear -- make -j$(nproc)"
      frame-title-format "Emacs"
      inhibit-startup-message t
      initial-scratch-message nil
      split-width-threshold 0
      split-height-threshold nil
      scroll-step 1
      scroll-margin 15
      scroll-conservatively 10000)

;;; ======================================================================
;;;                            Package sources
;;; ======================================================================
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

;;; ======================================================================
;;;                                Packages
;;; ======================================================================
(use-package vertico
  :init (vertico-mode)
  :config (setq vertico-cycle t))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :init (marginalia-mode))

(use-package doom-themes
  :config (load-theme 'doom-material-dark t))

(use-package vterm
  :config (setq vterm-kill-buffer-on-exit t)
  :bind ("C-c t" . vterm-other-window))

(use-package flycheck
  :init (global-flycheck-mode))

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-l")
  :hook (c++-mode c-mode))

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode)

(use-package company
  :hook (prog-mode)
  :config (setq company-minimum-prefix-length 1
                company-idle-delay 0.01))

(use-package evil
  :init (setq evil-want-integration t
              evil-want-keybinding nil)
  :config (evil-mode 1))

(use-package evil-collection
  :after evil
  :config (evil-collection-init))

(use-package key-chord
  :after evil
  :config
  (setq key-chord-one-key-delay 0.5)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-mode 1))

;;; ========================================================================
;;;                               Key Bindings
;;; ========================================================================
(global-set-key (kbd "C-x C-g") 'recentf-open-files)
(global-set-key (kbd "C-x ;") 'comment-or-uncomment-region)

;;; ========================================================================
;;;                                  Hooks
;;; ========================================================================
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook (lambda () (setq truncate-lines t)))
(add-hook 'before-save-hook 'lsp-format-buffer)

;;; ========================================================================
;;;                               Finalization
;;; ========================================================================
(provide 'init)
;;; init.el ends here
