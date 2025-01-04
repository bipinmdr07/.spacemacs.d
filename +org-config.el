(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "IN_PROGRESS(i)" "|" "DONE(d)"))))

;; -----------------------------------------
;; Auto clock in on changing the task status to inprogress;
;; -----------------------------------------
(defun org-clock-todo-change ()
  (if (string= org-state "IN_PROGRESS")
      (org-clock-in)
    (org-clock-out-if-current)))

(add-hook 'org-after-todo-state-change-hook 'org-clock-todo-change)

;; -----------------------------------------
