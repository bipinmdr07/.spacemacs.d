(setq doom-themes-treemacs-theme "doom-colors")
(setq yas-triggers-in-field t)

(setq lsp-enable-format-on-save t)

(setq lsp-completion-provider :capf)

;; Configure Org Agenda
(setq org-agenda-files '("~/Sync/org" "~/Sync/org/journal"))

;;--------------------------------
;; Configure deft
;; -------------------------------
(setq deft-directory "~/Sync/org"
      deft-extensions '("org" "ledger")
      deft-use-filename-as-title t
      deft-text-mode 'org-mode
      )

;; Bind key for opening Deft
(spacemacs/set-leader-keys
  "aod" 'deft) ;; a -> application, o -> org, d -> deft
;; -------------------------------

;; Configure org-roam
(use-package org-roam
  :custom
  (org-roam-directory "~/Sync/org/roam")
  :config
  (org-roam-db-autosync-mode)
  )

(use-package blamer
  :ensure t
  :config
  (global-blamer-mode 1)
  )

;; ------------------------------------------
;; Sort the codes visually selected by length of string in the line
;; ------------------------------------------
(defun sort-lines-by-length (reverse beg end)
  "Sort lines by legth."
  (interactive "P\nr")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (let ;; To make `end of line` and etc. to ignore fields.
          ((inhibit-field-text-motion t))
        (sort-subr reverse 'forward-line 'end-of-line nil nil
                   (lambda (l1 l2)
                     (apply #'< (mapcar (lambda (range) (- (cdr range) (car range)))
                                        (list l1 l2))))))
      ))
  )

(global-set-key (kbd "C-c L") 'sort-lines-by-length)
;; -------------------------------------------


;; Consider words separated by '_' as a single word
(add-hook 'after-change-major-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
