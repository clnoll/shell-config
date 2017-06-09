(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(use-package magit)
(use-package undo-tree
  :config
  (undo-tree-mode 1))

(load-file "~/dan-emacs-config/lib.el")

(server-start)

;; appearance
(load-theme 'railscasts t)
(set-cursor-color "red")
(blink-cursor-mode -1)
(tool-bar-mode -1)
(dan/set-show-paren-style)
(setq-default cursor-type 'bar)

;; projectile and helm
(use-package helm)
(use-package projectile)
(use-package helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq helm-full-frame t)


;; misc configuration
(setq vc-follow-symlinks t)
(global-linum-mode 1)

;; scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq linum-delay t)


;; tab completion
(setq tab-always-indent 'complete)

;; python
(setq python-shell-interpreter "/usr/local/bin/ipython3"
      python-shell-interpreter-args "-i")


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
    ("\C-x\C-f" . dan/find-file)
    ([(backtab)] . dan/indent-shift-left)
    ([(super /)] . comment-or-uncomment-region-or-line)
    ([(super ?,)] . (lambda () (interactive) (find-file (file-chase-links "~/.emacs.d/init.el")))))))


;; Hack to make tab indent the region when the region is active, and
;; maintain the active region afterwards.
(advice-add 'indent-for-tab-command :after
	    (lambda (&rest args)
	      (when (eq last-command 'indent-for-tab-command)
		(exchange-point-and-mark))))
(setq indent-region-function 'dan/indent-shift-right)


(require 'python)
(dan/register-key-bindings
 '("python" .
   (
    ;; insert pairs for python bindings here
    )))




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
