;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Hannes Leutloff"
      user-mail-address "hannes.leutloff@yeldirium.de")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-pro)
(setq doom-font (font-spec :family "Droid Sans Mono" :size 12))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/querbeet/workspace/private/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(map!
 "M-r" 'revert-buffer)

(map!
 :map general-override-mode-map
 "M-<up>" 'windmove-up
 "M-<right>" 'windmove-right
 "M-<down>" 'windmove-down
 "M-<left>" 'windmove-left)

(map! :map magit-mode-map
      :n "k" 'magit-discard)

;; Prevent emacs from overwriting system clipboard unintentionally.
(setq select-enable-clipboard nil)

(setq display-line-numbers-type 'relative)

;; Bind ledger-mode for .journal files.
(add-to-list 'auto-mode-alist '("\\.journal$" . ledger-mode))
;; Bind web-mode for .ejs files
(add-to-list 'auto-mode-alist '("\\.ejs$" . web-mode))

;; Make dired start in ranger mode.
(after! ranger
  (setq ranger-override-dired 'ranger))

(setq lsp-eslint-server-command
      '("node"
        "/home/yeldir/.vscode/extensions/dbaeumer.vscode-eslint-2.1.19/server/out/eslintServer.js"
        "--stdio"))

;; Improve visuals for flycheck info highlights.
(doom-themes-set-faces nil
  '(flycheck-info
    :foreground (doom-darken (doom-color 'fg) 0.5)
    :underline nil))

(doom-themes-set-faces nil
  '(line-number
    :foreground "#ffffff"))

;; Keybindings for evil-multiedit.
(map!
 :n "M-d" 'evil-multiedit-match-and-next
 :v "M-d" 'evil-multiedit-match-and-next
 :n "M-D" 'evil-multiedit-match-and-prev
 :v "M-D" 'evil-multiedit-match-and-prev)

(setq undo-tree-visualizer-diff t)
(after! undo-tree-mode 'undo-tree-visualizer-toggle-diff)

(map! :map typescript-mode-map
      :n "M-F" 'lsp-eslint-fix-all)

(map! :map ivy-minibuffer-map
      "RET" 'ivy-immediate-done)
