;;; Code:
(require 'iso-transl) ;; allow some keys (mainly accents in spanish)
(set-face-attribute 'default nil :height 120)
(load-theme 'gruvbox-dark-hard t) ;; load preferred theme
(global-visual-line-mode t) ;; add visual line wrapping
(setq
 gc-cons-threshold 100000000
 read-process-output-max (* 1024 1024) ;; 1mb
 lsp-completion-provider :capf
 lsp-idle-delay 0.500) ; increase gc threshold
(evil-mode 1)
(setq default-input-method 'TeX)

;; Keybindings
(global-set-key (kbd "C-c C-c") 'deadgrep)
(global-set-key (kbd "C-c C-r") 'org-roam-capture)
(global-set-key (kbd "C-c C-z") 'fzf)
(global-set-key (kbd "M-j") 'move-dup-move-lines-down)
(global-set-key (kbd "M-k") 'move-dup-move-lines-up)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-x w") 'delete-frame)

;; Integrations
(add-hook 'after-init-hook #'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'yaml-mode-hook #'whitespace-mode)

;; Undo Tree
(global-undo-tree-mode)
(setq undo-tree-visualizer-diff t
      undo-tree-visualizer-timestamps t)

;; Prioritise UTF-8
(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; Turn off autosave
(setq
 make-backup-files nil
 auto-save-default nil
 create-lockfiles nil)

;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))
;; Visuals
(ignore-errors (set-frame-font "Fira Code-12"))
(doom-modeline-mode)
(setq doom-challenger-deep-brighter-comments t
      doom-challenger-deep-brighter-modeline t)
(show-paren-mode)
(electric-pair-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode) ;; Use rainbow delimiters in programming mode
;; (add-hook 'prog-mode-hook #'highlight-indent-guides-mode)

;; Emojis, yes, emojis
(if (display-graphic-p)
    (setq emojify-display-style 'image
	  emojify-display-style 'unicode))

;; All The Icons
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; Org stuff
(setq org-highlight-latex-and-related '(latex))
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
(add-hook 'org-mode-hook 'org-appear-mode)
(setq org-superstar-special-todo-items t)
(setq org-startup-with-inline-images "inlineimages"
      org-pretty-entities t
      org-pretty-entities-include-sub-superscripts t
      org-element-use-cache t)
(org-link-beautify-mode 1)

;;; org-books
(setq org-books-file "~/Documents/org/reading_list.org")


;;; Org Roam
(setq
 org-roam-directory (file-truename "~/Documents/wiki")
 org-roamc-db-location "~/.cache/org-roam.db"
 org-roam-tag-sources '(prop all-directories)
 org-roam-v2-ack t)

;; Window stuff
(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

;; Direnv
(envrc-global-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" default))
 '(doc-view-continuous t)
 '(evil-undo-system 'undo-tree)
 '(global-undo-tree-mode t)
 '(org-agenda-files '("~/Documents/org/agenda.org"))
 '(org-list-allow-alphabetical t)
 '(read-file-name-completion-ignore-case t)
 '(undo-tree-visualizer-diff t)
 '(undo-tree-visualizer-timestamps t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(provide 'init)
;;; init.el ends here
