;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (not package-archive-contents)
    (package-refresh-contents))

(set-frame-font "Hack-8:bold")

(windmove-default-keybindings)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(global-linum-mode t)
(show-paren-mode 1)

(set confirm-nonexistent-file-or-buffer nil)
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
	    kill-buffer-query-functions))
(setq x-select-enable-clipboard t)
(setq inhibit-startup-screen t)
(defvar show-paren-delay 0)
(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-set-key (kbd "C-x v") 'yank)
(global-unset-key (kbd "C-x c"))

(defun cheat ()
  "Opens binding cheat file."
  (interactive)
  (find-file "/home/james/.cheat"))

(global-set-key (kbd "C-x p c") 'cheat)

(provide 'general)
;;; general.el ends here
