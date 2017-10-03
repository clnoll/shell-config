(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(use-package helm)
(use-package projectile)
(use-package helm-projectile)
(use-package magit)

(use-package undo-tree
  :config
  (undo-tree-mode 1))

(load-file "~/dan-emacs-config/lib.el")

(require 'server)
(unless (server-running-p) (server-start))

;; appearance
(load-theme 'railscasts t)
(set-cursor-color "red")
(blink-cursor-mode -1)
(tool-bar-mode -1)
(defun dan/set-show-paren-style ()
  (show-paren-mode t)
  (setq show-paren-delay .125)
  (setq show-paren-style 'parenthesis)
  (set-face-attribute 'show-paren-match nil :weight 'extra-bold)
  (set-face-background 'show-paren-match (face-background 'default))
  (set-face-attribute 'show-paren-match nil :foreground "red"))
(dan/set-show-paren-style)
(setq-default cursor-type 'bar)

;; projectile and helm
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq helm-full-frame t)

;;; Yasnippet
(setq yas/trigger-key [tab])
(define-key yas/keymap [tab] 'yas/next-field)
(yas/initialize)
(defun dan/yas-load ()
  (interactive)
  (yas/load-directory "/Users/catherine/configfiles/emacs-snippets"))
(dan/yas-load)


;; multiple cursors
(advice-add 'mc/edit-lines :before (lambda (&rest args) (previous-logical-line 1 nil)))


;; misc configuration
(setq vc-follow-symlinks t)
(global-linum-mode 1)
(setq truncate-lines t)
(setq make-backup-files nil)
(delete-selection-mode)

(dan/set-exec-path-from-shell)


;; latex
(defun dan/latex-mode-hook-fn ()
  (interactive)
  (dan/setup-paired-characters)
  (local-set-key "\C-c\C-c" 'dan/save-even-if-not-modified)
  (dan/set-up-outline-minor-mode "\\(\\\\sub\\|\\\\section\\)")
  (dan/latex-watch))
(add-hook 'latex-mode-hook 'dan/latex-mode-hook-fn)

;; (setq exec-path
;;       (append '("/usr/local/texlive/2016basic/bin/x86_64-darwin") exec-path))


(dan/register-key-bindings
 '(outline-minor-mode-map
   .
   (([(control tab)] . org-cycle)
    ([(backtab)] . org-global-cycle))))


;; mode hooks
(require 'scheme)
(defun lisp-modes-hook-fn ()
  (paredit-mode))

(add-hook 'emacs-lisp-mode-hook 'lisp-modes-hook-fn)
(add-hook 'scheme-mode-hook 'lisp-modes-hook-fn)

(defun dan/minibuffer-setup-hook-fn ()
  (when (eq this-command 'eval-expression)
    (setq completion-at-point-functions '(lisp-completion-at-point t))
    (local-set-key [tab] 'complete-symbol)
    (paredit-mode 1)))
(add-hook 'minibuffer-setup-hook 'dan/minibuffer-setup-hook-fn)

(defun cnoll-kill-line ()
  (interactive)
  (beginning-of-line)
  (kill-line))

;; key bindings
;; Look at https://github.com/dandavison/emacs-config/blob/master/emacs.el#L262
;; for examples of setting key bindings.

(dan/register-key-bindings
 '(global-map
   .
   (("\C-cg" . magit-status)
    ("\C-xd" . dan/dired-no-ask)
    ([(super ?i)] . dan/insert-ipdb-set-trace)
    ("\C-x\C-f" . dan/find-file)
    ([(backtab)] . dan/indent-shift-left)
    ([(super ?>)] . dan/helm-projectile-grep-no-input)
    ([(super ?.)] . dan/helm-projectile-grep-thing-at-point)
    ([(super /)] . comment-or-uncomment-region-or-line)
    ([(super ?,)] . (lambda () (interactive) (find-file (file-chase-links "~/.emacs.d/init.el")))))))


;; Hack to make tab indent the region when the region is active, and
;; maintain the active region afterwards.
(advice-add 'indent-for-tab-command :after
	    (lambda (&rest args)
	      (when (eq last-command 'indent-for-tab-command)
		(exchange-point-and-mark))))
(setq indent-region-function 'dan/indent-shift-right)


;; Python
(require 'python)
(dan/register-key-bindings
 '("python" .
   (
    ;; insert pairs for python bindings here
    )))

(defun python-hook-function ()
  (jedi:setup)
  (flycheck-mode))

(add-hook 'python-mode-hook 'python-hook-function)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
