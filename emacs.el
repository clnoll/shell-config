(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;; appearance
(load-theme 'railscast t)
(set-cursor-color "red")
(setq cursor-type 'bar)
(blink-cursor-mode -1)
(tool-bar-mode -1)

;; tab completion
(setq tab-always-indent 'complete)

;; mode hooks
(require 'scheme)
(add-hook 'scheme-mode-hook (lambda () (paredit-mode)))

(defun dan/minibuffer-setup-hook-fn ()
  (when (eq this-command 'eval-expression)
    (setq completion-at-point-functions '(lisp-completion-at-point t))
    (local-set-key [tab] 'complete-symbol)
    (paredit-mode 1)))
(add-hook 'minibuffer-setup-hook 'dan/minibuffer-setup-hook-fn)
