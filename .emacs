;;; package --- Summary
;;; Commentary:
;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elisp/")
(load-library "general")
;;(load-library "latex")
(load-library "programming")
(load-library "org_setup")

(add-to-list 'load-path "path-to-julia-mode")
(require 'julia-mode)

(defvar reftex-label-alist '((nil ?e nil "~\\eqref{%s}" nil nil)))


(use-package evil
  :commands (evil-mode)
  :init
  (defvar evil-insert-state-cursor 'box)
  (evil-mode t))

(use-package helm
  :commands (helm-command-prefix
	     helm-execute-persistent-action
	     helm-select-action
	     helm-resume
	     helm-find-files
	     helm-occur)
  :bind (("M-x" . helm-M-x)
	 ("C-M-z" . helm-resume)
	 ("C-M-f" . helm-find-files)
	 ("C-c j o" . helm-occur)
	 :map helm-map
	 ("<tab>" . helm-execute-persistent-action)
	 ("C-z" . helm-select-action))
  :init
    (setq helm-split-window-in-side-p t)
    (setq helm-move-to-line-cycle-in-source t)
    (helm-mode 1))

(use-package sr-speedbar
  :commands (sr-speedbar-toggle)
  :bind (("C-c n" . sr-speedbar-toggle))
  :init
  (setq speedbar-use-images nil)
  (setq sr-speedbar-default-width 30))

;; theme settings
(use-package moe-theme
  :commands (moe-dark)
  :init
  (add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/moe-theme-20170111.1838")
  (add-to-list 'load-path "~/.emacs.d/elpa/moe-theme-20170111.1838")
  (moe-dark))

;;(load-theme 'tango-dark)

;; autocomplete settings
(use-package auto-complete)
(use-package auto-complete-config
  :commands (ac-config-default
	     global-auto-complete-mode)
  :init
  (ac-config-default)
  (global-auto-complete-mode t))

;; yasnippet settins
(use-package yasnippet
  :commands (yas-global-mode)
  :init
  (add-to-list 'load-path
	       "~/.emacs.d/yasnippet")
  (setq yas-snippet-dirs
	'("~/.emacs.d/yasnippet/snippets/"
	  "~/lib/yas/"))
  (yas-global-mode 1))

(use-package ibufffer
  :commands (ibuffer)
  :bind (("C-x b" . ibuffer))
  :init
  (defvar ibuffer-saved-filter-groups
    '(("home"
       ("emacs-config" (or (filename . ".emacs")
			     (filename . "emacs-config")))
       ("Python" (mode . python-mode))
       ("LaTeX" (mode . latex-mode))
       ("Org" (mode . org-mode))
       ("Help" (or (name . "\*Help\*")
		   (name . "\*Apropos\*")
		   (name . "\*info\*")))
       ("c++" (mode . c++-mode))
       ("c" (mode . c-mode)))))
  (add-hook 'ibuffer-mode-hook
	    '(lambda ()
	       (ibuffer-switch-to-saved-filter-groups "home")))
  (defvar ibuffer-expert t)
  (defvar ibuffer-show-empty-filter-groups nil))

;; pdf-tools settings
(pdf-tools-install)
(defvar auto-revert-interval 0.5)

(use-package irony
  :commands (irony-mode)
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company
  :commands (company-mode
	     company-mode-map
	     company-active-map
	     company-complete
	     company-select-next
	     company-select-previous)
  :bind (:map company-mode-map
	       ("M-/" . company-complete)
	       :map company-active-map
	       ("M-n" . company-select-next)
	       ("M-m" . company-select-previous))
  :init
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode)
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap-complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook ' 'irony-cdb-autosetup-compile-options)
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-irony))
  (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands))
  
(use-package flycheck
  :commands (flycheck-mode
	     flycheck-irony-setup)
  :init
  (global-flycheck-mode)
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))
  

(defvar font-latex-fontify-script nil)
(defvar font-latex-fontify-sectioning 1.0)

;; compile latex
(defun compile-latex ()
  "Compile current buffer if in latex mode."
  (interactive)
  (let ((comm (concat "pdflatex " (message "%s" default-directory) (buffer-name))))
    (if (string-equal (message "%s" major-mode) "latex-mode")
	(shell-command-to-string comm)
      )))

(global-set-key (kbd "C-x y") 'compile-latex)


(defun compile-latex-and-bibtex ()
  "Compile current buffer if in latex mode (including bibtex)."
  (interactive)
  (let ((comm (concat "pdflatex " (message "%s" default-directory) (buffer-name))))
    (if (string-equal (message "%s" major-mode) "latex-mode")
	(shell-command-to-string comm)
      ))
  (let ((commb (concat "bibtex " (substring (buffer-name) 0 -4))))
    (if (string-equal (message "%s" major-mode) "latex-mode")
	(shell-command-to-string commb)
      ))
  (let ((comm (concat "pdflatex " (message "%s" default-directory) (buffer-name))))
    (if (string-equal (message "%s" major-mode) "latex-mode")
	(shell-command-to-string comm)
      ))
  (let ((comm (concat "pdflatex " (message "%s" default-directory) (buffer-name))))
    (if (string-equal (message "%s" major-mode) "latex-mode")
	(shell-command-to-string comm)
      )))

(global-set-key (kbd "C-x t") 'compile-latex-and-bibtex)

;; latex mode setup
(defun latex-mode-setup ()
  "Setup the windows and open pdf of latex file."
  (interactive)
  (let ((tex (buffer-name)))
    (let ((pdf (concat (message "%s" default-directory) (substring tex 0 -3) "pdf")))
	(split-window-horizontally)
	(other-window 1)
	(find-file pdf)
	(auto-revert-mode)
	(other-window -1)
	(switch-to-buffer tex))))

(add-hook 'LaTeX-mode-hook 'latex-mode-setup)

(defun shell-other-window ()
  "Open a shell in a new window."
  (interactive)
  (let ((buf (shell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))

(global-set-key (kbd "C-x p s") 'shell-other-window)


(provide '.emacs)
;;; .emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4c9ba94db23a0a3dea88ee80f41d9478c151b07cb6640b33bfc38be7c2415cc4" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
