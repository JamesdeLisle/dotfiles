;;; package --- Summary
;;; Commentary:
;;; Code:

(defun xah-next-buffer-of-same-mode ()
  "Switch to next buffer of same mode."
  (interactive)
  (let ((base-mode (message "%s" major-mode)))
    (next-buffer)
    (let ((i 0))
      (while (< i 20)
	(if (not (string-equal (message "%s" major-mode) base-mode))
	    (progn (next-buffer)
		   (setq i  (1+ i)))
	  (progn (setq i 100 )))))))

(global-set-key (kbd "C-<tab>") 'xah-next-buffer-of-same-mode)

(defun setup-dev-env ()
  "Set up the window config for programming."
  (interactive)
  (split-window-horizontally)
  (split-window-horizontally)
  (balance-windows)
  (other-window 1)
  (other-window 1)
  (split-window-vertically)
  (multi-term)
  (other-window 1)
  (other-window 1))

(global-set-key (kbd "C-x p e") 'setup-dev-env)

(defun three-even-split ()
  "Setup three evenly split vertial windows."
  (interactive)
  (split-window-horizontally)
  (split-window-horizontally)
  (balance-windows))

(global-set-key (kbd "C-x p 3") 'three-even-split)

(defun vertical-shell ()
  "Create a new shell in vertial split."
  (interactive)
  (split-window-vertically)
  (multi-term))

(global-set-key (kbd "C-x p l") 'vertical-shell)

(defun six-even-split-term ()
  "Setup three evenly split vertial windows."
  (interactive)
  (split-window-horizontally)
  (split-window-horizontally)
  (split-window-vertically)
  (windmove-right)
  (split-window-vertically)
  (windmove-right)
  (vertical-shell)
  (balance-windows))

(global-set-key (kbd "C-x p 6") 'six-even-split-term)

(provide 'programming)
;;; programming.el ends here
