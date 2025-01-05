;; -----------------------------------------------
;; Add current branch name to commit.
;; -----------------------------------------------
(defun add-branch-name-to-commit-message()
  (insert (concat (magit-get-current-branch) ": ")))

(add-hook 'git-commit-mode-hook 'add-branch-name-to-commit-message)
;; -----------------------------------------------

;; ------------------------------------------------
;; Accepting the both changes from the buffer A and B in ediff
;; ------------------------------------------------
(defun ediff-copy-both-to-C()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))

(add-hook 'ediff-keymap-setup-hook (lambda () (define-key ediff-mode-map "B" 'ediff-copy-both-to-C)))
;; ------------------------------------------------
