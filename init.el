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
     (spacemacs-editing-visual :packages
                               hide-comnt
                               hl-anything
                               highlight-numbers
                               highlight-parentheses
                               )
     (spacemacs-misc :packages
                     dumb-jump)
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
     ivy
     git
     (version-control :variables
                      version-control-global-margin t)
     ;; langs
     emacs-lisp
     racket
     (clojure :variables clojure-enable-fancify-symbols t)
     (haskell :variables haskell-completion-backend 'dante)
     coq
     ott
     ;; agda-mode locate
     ;; (agda :variables agda-mode-path (shell-command-to-string "agda-mode locate"))
     ;; local
     )
   dotspacemacs-additional-packages '(paren-face)
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
   dotspacemacs-themes '(tao-yang)
   dotspacemacs-mode-line-theme 'vanilla
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 12.0
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
   dotspacemacs-frame-title-format "%a"
   dotspacemacs-icon-title-format nil
   dotspacemacs-whitespace-cleanup 'all
   dotspacemacs-zone-out-when-idle nil
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  ;; mirror repo
  ;; (setq configuration-layer-elpa-archives
  ;;       '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
  ;;         ("org-cn"   . "http://elpa.emacs-china.org/org/")
  ;;         ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))
  ;; fringe
  ;; (fringe-mode 0)
  ;; custom file generation
  (setq custom-file "~/.spacemacs.d/custom.el")
  (unless (file-exists-p custom-file)
    (write-region "" nil custom-file))
  ;; racket-program bin
  (setq racket-program "/usr/local/bin/racket")
  ;; coq
  (setq coq-compile-before-require 't)
  (setq coq-diffs 'removed)
  ;; for cabal
  (setq exec-path (append exec-path '("~/.cabal/bin")))
  ;; tao theme
  (setq tao-theme-use-sepia nil)
  ;; load-path
  (load-file (expand-file-name ".spacemacs.d/utils/prettify-utils.el" user-home-directory))
  )

(defun dotspacemacs/user-load ()
  )

(defun dotspacemacs/user-config ()
  ;; transparency
  (setq default-frame-alist
        '(
          (ns-transparent-titlebar . t)
          ;;(ns-appearance . dark)
          (alpha . 99)))
  ;; paren-face
  (global-paren-face-mode)
  ;; maximize frame at startup
  (toggle-frame-maximized)
  ;; langs setup
  (emacs-lisp-mode/user-config)
  (racket-mode/user-config)
  (clojure-mode/user-config)
  )

(defun emacs-lisp-mode/user-config ()
  "emacs lisp major mode configs collection"
  ;; enable smartparens-mode
  (add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
  )

(defun racket-mode/user-config ()
  "racket major mode configs collection"
  ;; symbols
  (require 'prettify-utils)
  (defun prettify-set ()
    (setq prettify-symbols-alist
		      (prettify-utils-generate
		       ("lambda"	"λ")
           ("tau"     "τ")
           ("psi"     "ψ")
           ("Psi"     "Ψ")
           ("gamma"   "γ")
           ("Gamma"   "Γ")
		       ("|>"		"▷")
		       ("<|"		"◁")
		       ("->>"		"↠")
		       ("->"		"→")
		       ("<-"		"←")
		       ("=>"		"⇒")
		       ("<="		"≤")
		       (">="		"≥")
           )))
  ;; (setq prettify-symbols-alist
  ;;       '(("yy" . (?y (tr . Bc) 1645 (br . cr) ?i)))))
  ;; step1 : set mode
  (add-hook 'racket-mode-hook #'prettify-symbols-mode)
  ;; step2 : set so-called buffer-local alist
  (add-hook 'racket-mode-hook (lambda ()
                                (prettify-set)
                                (modify-syntax-entry ?_ ".")))
  ;; evil in racket
  (add-hook 'racket-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))
  ;; enable xp-mode
  (require 'racket-xp)
  (add-hook 'racket-mode-hook #'racket-xp-mode)
  ;; disable racket-mode postip
  (delete #'racket-show-pos-tip racket-show-functions)
  ;; enable smartparens-mode
  (add-hook 'racket-mode-hook #'smartparens-mode)
  )

(defun clojure-mode/user-config ()
  "clojure major mode configs collection"
  ;; enable smartparens-mode
  (add-hook 'clojure-mode-hook #'smartparens-mode)
  )
