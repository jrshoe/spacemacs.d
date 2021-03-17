;; -*- mode: emacs-lisp; lexical-binding: t -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs-base
   dotspacemacs-enable-lazy-installation nil
   dotspacemacs-ask-for-lazy-installation nil
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;; base
     spacemacs-navigation
     spacemacs-evil
     spacemacs-editing
     (spacemacs-editing-visual :packages
                               hide-comnt
                               hl-anything
                               highlight-numbers)
     spacemacs-misc
     (spacemacs-visual :packages
                       ansi-colors
                       hl-todo)
     spacemacs-layouts
     taoline
     spacemacs-project
     ;; basic
     better-defaults
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip nil
                      auto-completion-enable-snippets-in-popup t)
     (syntax-checking :variables
                      syntax-checking-enable-tooltips nil)
     (ivy :variables
          ivy-enable-advanced-buffer-information t)
     git
     (version-control :variables
                      version-control-global-margin t)
     ;; langs
     emacs-lisp
     racket
     (haskell :variables haskell-completion-backend 'dante)
     coq
     ott
     ;; agda-mode locate
     ;; (agda :variables agda-mode-path (shell-command-to-string "agda-mode locate"))
     ;; local
     )
   dotspacemacs-additional-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '(
                                    ;; spacemacs-modeline
                                    doom-modeline
                                    vi-tilde-fringe
                                    )
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-enable-emacs-pdumper nil
   dotspacemacs-emacs-pdumper-executable-file "emacs"
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-gc-cons '(100000000 0.1)
   dotspacemacs-use-spacelpa nil
   dotspacemacs-verify-spacelpa-archives nil
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory 'emacs-version
   dotspacemacs-editing-style 'hybrid
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-new-empty-buffer-major-mode 'text-mode
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-initial-scratch-message nil
   dotspacemacs-themes '(spacemacs-dark)
   dotspacemacs-mode-line-theme 'vanilla
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Cascadia Code"
                               :size 14.0
                               :weight normal
                               :width normal)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   dotspacemacs-loading-progress-bar nil
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-undecorated-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis t
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-enable-server nil
   dotspacemacs-server-socket-dir nil
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   dotspacemacs-frame-title-format (if (equal system-type 'gnu/linux) "%t >> %b" "")
   dotspacemacs-icon-title-format nil
   dotspacemacs-whitespace-cleanup 'all
   dotspacemacs-zone-out-when-idle nil
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  ;; custom file generation
  (setq custom-file "~/.spacemacs.d/custom.el")
  (unless (file-exists-p custom-file)
    (write-region "" nil custom-file))
  ;; load-path
  (load-file (expand-file-name ".spacemacs.d/utils/prettify-utils.el" user-home-directory))
  (load-file (expand-file-name ".spacemacs.d/utils/prettify-redex.el" user-home-directory))
  ;; langs
  (racket-mode/user-init)
  (coq-mode/user-init)
  (haskell-mode/user-init)
  )

(defun dotspacemacs/user-load ()
  )

(defun dotspacemacs/user-config ()
  ;; transparency
  (setq default-frame-alist
        '((ns-transparent-titlebar . t)
          (alpha . 99)))
  ;; maximize frame at startup
  (toggle-frame-maximized)
  ;; utility functions
  ;; redex symbols
  (defun prettify-set ()
    (setq prettify-symbols-alist
          prettify-redex-alist))
  ;; langs setup
  (add-hook 'emacs-lisp-mode-hook (lambda () (emacs-lisp-mode/user-config)))
  (add-hook 'racket-mode-hook (lambda () (racket-mode/user-config)))
  (add-hook 'racket-repl-mode-hook (lambda () (racket-mode/user-config)))
  (add-hook 'coq-mode-hook (lambda () (coq-mode/user-config)))
  (add-hook 'haskell-mode-hook (lambda () (haskell-mode/user-config)))
  )

(defun haskell-mode/user-config ()
  "haskell major mode configs collection"
  ;; This changes the evil "O" and "o" keys for haskell-mode to make sure that
  ;; indentation is done correctly. See
  ;; https://github.com/haskell/haskell-mode/issues/1265#issuecomment-252492026.
  (defun haskell-evil-open-above ()
    (interactive)
    (evil-digit-argument-or-evil-beginning-of-line)
    (haskell-indentation-newline-and-indent)
    (evil-previous-line)
    (haskell-indentation-indent-line)
    (evil-append-line nil))

  (defun haskell-evil-open-below ()
    (interactive)
    (evil-append-line nil)
    (haskell-indentation-newline-and-indent))

  (evil-define-key 'normal haskell-mode-map
    "o" 'haskell-evil-open-below
    "O" 'haskell-evil-open-above)

  ;; disable tip
  (setq haskell-process-show-debug-tips nil)
  ;; hungry delete
  (hungry-delete-mode)
  ;; keybindings
  (global-keys-preference)
  )

(defun emacs-lisp-mode/user-config ()
  "emacs lisp major mode configs collection"
  )

(defun racket-mode/user-init ()
  "racket major mode inits collection"
  ;; racket-program bin
  (when (eq system-type 'darwin)
    (setq racket-program "/usr/local/bin/racket"))
  (when (eq system-type 'gnu/linux)
    (setq racket-program "/usr/bin/racket"))
  )

(defun racket-mode/user-config ()
  "racket major mode configs collection"
  ;; prettify symbols
  (prettify-set)
  (prettify-symbols-mode)
  (modify-syntax-entry ?_ ".")
  ;; evil dw in racket
  (modify-syntax-entry ?- "w")
  ;; enable xp-mode
  (require 'racket-xp)
  (racket-xp-mode)
  ;; disable racket-mode postip
  (setq racket-show-functions '(racket-show-echo-area))
  ;; show-paren-mode
  (show-paren-mode)
  (setq show-paren-style 'expression)
  (set-face-attribute 'show-paren-match-expression nil
                      :background "#444155")
  (aggressive-indent-mode))

(defun coq-mode/user-init ()
  "coq major mode inits collection"
  ;; coq
  (setq coq-compile-before-require 't)
  (setq coq-diffs 'removed)
  )

(defun coq-mode/user-config ()
  "coq major mode configs collection"
  ;; use 2 view
  (setq proof-three-window-enable nil)
  ;; fix broken faces
  (set-face-attribute 'coq-button-face nil
                      :background "#292b2e")
  (set-face-attribute 'coq-solve-tactics-face nil
                      :foreground "#9370db"))

(defun haskell-mode/user-init ()
  "haskell major mode inits"
  ;; for cabal
  (setq exec-path (append exec-path '("~/.cabal/bin")))
  ;; for ghcup
  (setq exec-path (append exec-path '("~/.ghcup/bin"))))

(defun global-keys-preference ()
  "my favored keybindings"
  ;; SPC k w
  (spacemacs/set-leader-keys "kw" 'sp-wrap-round)
  )
