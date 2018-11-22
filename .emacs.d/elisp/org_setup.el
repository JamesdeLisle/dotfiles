;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'org)
(setq org-todo-keywords'((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-blank-before-new-entry '((headings . t) (plain-list-item . 1)))
(defvar org-agenda-span 7)
(defvar org-agenda-skip-deadline-if-done t)
(defvar org-agenda-skip-scheduled-if-done t)
(defvar org-agenda-start-on-weekday nil)
(defvar org-todo-keyword-faces)
(setq org-todo-keyword-faces
      '(("DEADLINE" . "blue")
	("APPOINTMENT" . "yellow")))
(defun access-org-files ()
  "Create buffer and open helm-occur in org-directory."
  (interactive)
  (split-window-horizontally)
  (find-file "~/Dropbox/org"))

(global-unset-key (kbd "C-c o"))
(global-set-key (kbd "C-c o a") 'org-agenda-list)
(global-set-key (kbd "C-c o l") 'org-store-link)
(global-set-key (kbd "C-c o r") 'org-refile)
(global-set-key (kbd "C-c o t") 'org-todo-list)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c o f") (lambda () (interactive)(find-file org-directory)))
(setq org-agenda-files '("~/Dropbox/org/dead.org"
			 "~/Dropbox/org/app.org"
			 "~/Dropbox/org/todo.org"))
(setq org-refile-targets
      '((nil :maxlevel . 3)
	(org-agenda-files :maxlevel . 3)))
(setq org-log-done t)
(defvar org-capture-templates)
(setq org-capture-templates
      '(("t" "Todo - Short Term" entry (file+headline (concat org-directory "/todo.org") "Short-Term")
	 "* TODO %? \nSCHEDULED: %^T")
	("p" "Todo - Projects" entry (file+headline (concat org-directory "/todo.org") "Projects")
	 "* TODO %?")
	("l" "Todo - Long Term" entry (file+headline (concat org-directory "/todo.org") "Long term")
	 "* TODO %?")
	("d" "Todo - DEADLINE" entry (file (concat org-directory "/dead.org"))
	 "* DEADLINE %? \nDEADLINE: %^T")
	("j" "Journal" entry (file (concat org-directory "/journal.org"))
	 "* %?\nEntered on %U\n %i\n %a")
	("r" "Reference" entry (file+headline (concat org-directory "/todoref.org") (concat "hi" "ho"))
	 "* %a\n%?\nEntered on %U\n %i")
	("a" "Appointment" entry (file (concat org-directory "/app.org"))
	 "* APPOINTMENT %? \nDEADLINE: %^T")
	("L" "Link" plain (file (concat org-directory "/links.org"))
	 "- %?\n %x\n")))
(remove-hook 'org-mode-hook 'visual-line-mode-hook)
(with-eval-after-load 'org
  (setq org-startup-indented t)
  (add-hook 'org-mode-hook 'auto-fill-mode))

(provide 'org_setup)
;;; org_setup.el ends here
