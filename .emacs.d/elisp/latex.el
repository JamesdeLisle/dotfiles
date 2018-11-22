;;; package --- Summary
;;; Commentary:
;;; Code:

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

(provide 'latex)
;;; latex.el ends here
