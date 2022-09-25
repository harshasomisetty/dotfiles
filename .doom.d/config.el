;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Harsha Somisetty"
      user-mail-address "hs884@scarletmail.rutgers.edu")

;; https://discourse.doomemacs.org/t/how-to-change-your-splash-screen/57
(load "~/.quotes.el")
(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center +doom-dashboard--width (nth (random (length quotes)) quotes))))

(setq doom-font (font-spec :family "Fira Code" :style "Retina" :size 14 :height 1.0)
      doom-variable-pitch-font (font-spec :family "Nunito" :size 14 :height 1.3)
      doom-big-font (font-spec :family "Fira Code" :style "Retina" :size 24))

(global-auto-revert-mode t)

(add-hook! 'org-mode-hook #'+org-pretty-mode #'mixed-pitch-mode)
(add-hook! 'org-mode-hook (company-mode -1))
(add-hook! 'org-capture-mode-hook (company-mode -1))

(setq
 doom-theme 'doom-vibrant
 display-line-numbers-type nil
 default-directory "~"
 org-directory "~/org/"
 dart-format-on-save t
 truncate-lines nil
 web-mode-markup-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-css-indent-offset 2
 mac-command-modifier 'meta
 js-indent-level 2
 typescript-indent-level 2
 json-reformat:indent-width 2
 projectile-project-search-path '("~/code/")
 org-startup-indented t
 org-ellipsis " ▼ " ;; folding symbol
 org-capture-templates '(("x" "Note" entry
                          (file+olp+datetree "journal.org")
                          "**** [ ] %U %?" :prepend t :kill-buffer t)
                         ("t" "Task" entry
                          (file+headline "tasks.org" "Inbox")
                          "* [ ] %?\n%i" :prepend t :kill-buffer t))

 )

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))

(add-hook 'js2-mode-hook #'format-all-mode)
(add-hook 'typescript-mode-hook #'format-all-mode)
(add-hook 'rjsx-mode-hook #'format-all-mode)
(add-hook 'js2-mode-hook #'prettier-js-mode)
(add-hook 'typescript-mode-hook #'prettier-js-mode)
(add-hook 'rjsx-mode-hook #'prettier-js-mode)
(add-hook 'python-mode-hook #'format-all-mode)
(add-hook 'python-mode-hook #'python-black-on-save-mode)

(setq lsp-tailwindcss-add-on-mode t)

(setq rustic-default-test-arguments "--benches --tests --all-features -- --color always --nocapture")


(defun hanno/template-insert-gitignore()
  (interactive)
  (let* ((dir (concat doom-private-dir "/templates/gitignore/"))
         (files (directory-files dir nil ".*\\.gitignore"))
         (pick (yas-choose-value (mapcar #'file-name-sans-extension files))))
    (insert-file-contents (concat dir (concat pick ".gitignore")))))
(set-file-template! "\\.gitignore$" :trigger 'hanno/template-insert-gitignore :mode 'gitignore-mode)


(setq org-journal-dir "~/org/journal/"
      org-journal-file-format "%Y%m%d"
      org-journal-date-format "%A, %e %b %Y"
      org-journal-date-prefix ""
      org-journal-find-file 'find-file)

(defun org-journal-file-header-func (time)
  "Custom function to create journal header."
  (concat
   (pcase org-journal-file-type
     (`daily "#+TITLE: "))))

(setq org-journal-file-header 'org-journal-file-header-func)

(defun insert-created-date (&rest ignore)
  (insert (concat
           "\n* Gratitude"
           "\n* Moments"
           "\n* Accomplishments"
           )))

(add-hook 'org-journal-after-header-create-hook
          #'insert-created-date)

(map! :leader :prefix "n"
      (:prefix "j" :desc "Go to current journal" "c" #'org-journal-open-current-journal-file ))

(after! org
  (custom-set-faces!
    '(org-document-title :height 1.2)
    '(org-level-1 :inherit outline-1 :weight extra-bold :height 1.25)
    '(org-level-2 :inherit outline-2 :weight bold :height 1.15)
    '(org-level-3 :inherit outline-3 :weight bold :height 1.12)
    '(org-level-4 :inherit outline-4 :weight bold :height 1.09)
    '(org-level-5 :inherit outline-5 :weight semi-bold :height 1.06)
    '(org-level-6 :inherit outline-6 :weight semi-bold :height 1.03)
    '(org-level-7 :inherit outline-7 :weight semi-bold)
    '(org-level-8 :inherit outline-8 :weight semi-bold)
    '(org-level-9 :inherit outline-9 :weight semi-bold)
    '(org-level-10 :inherit outline-10 :weight semi-bold)
    '(org-level-11 :inherit outline-11 :weight semi-bold)
    '(org-block nil :foreground nil :inherit 'fixed-pitch)
    '(org-code nil   :inherit '(shadow fixed-pitch))
    '(org-table nil   :inherit '(shadow fixed-pitch))
    '(org-verbatim nil :inherit '(shadow fixed-pitch))
    '(org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
    '(org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
    '(org-checkbox nil :inherit 'fixed-pitch)))



(setq org-roam-directory (concat org-directory "roam/")
      org-roam-dailies-directory (concat org-roam-directory "daily/")
      org-roam-completion-everywhere t
      org-roam-capture-templates '(
                                   ("d" "default" plain
                                    "\n\n* %?"
                                    :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
                                    :unnarrowed t)
                                   ("f" "Fact" plain
                                    "\n\n* %?"
                                    :if-new (file+head "facts/%<%Y%m%d%H%M%S>-${slug}.org" "#+filetags: %^{tags}\n#+title: ${title}\n")
                                    :unnarrowed t)
                                   ("b" "Book" plain
                                    "\n\n* %?"
                                    :if-new (file+head "books/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
                                    :unnarrowed t)
                                   ("P" "Podcast" plain
                                    "\n\n* %?"
                                    :if-new (file+head "podcasts/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
                                    :unnarrowed t)
                                   )
      org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n")))
      )

(after! org-roam

  (cl-defmethod org-roam-node-directories ((node org-roam-node))
    (if-let ((dirs (file-name-directory (file-relative-name (org-roam-node-file node) org-roam-directory))))
        (format "(%s)" (car (f-split dirs)))
      ""))

  (defun org-roam-node-insert-immediate (arg &rest args)
    (interactive "P")
    (let ((args (cons arg args))
          (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                    '(:immediate-finish t)))))
      (apply #'org-roam-node-insert args)))

  (cl-defmethod org-roam-node-backlinkscount ((node org-roam-node))
    (let* ((count (caar (org-roam-db-query
                         [:select (funcall count source)
                          :from links
                          :where (= dest $s1)
                          :and (= type "id")]
                         (org-roam-node-id node)))))
      (format "[%d]" count)))

  (cl-defmethod org-roam-node-directories ((node org-roam-node))
    (if-let ((dirs (file-name-directory (file-relative-name (org-roam-node-file node) org-roam-directory))))
        (format "(%s)" (string-join (f-split dirs) "/"))
      ""))


  (setq org-roam-node-display-template "${directories:10} ${title:100} ${tags:10} ${backlinkscount:6}")

  )

(setq mac-option-modifier 'meta
      mac-right-option-modifier 'meta
      mac-left-option-modifier 'meta
      mac-pass-command-to-system nil
      ns-left-option-modifier 'meta
      ns-right-option-modifier 'meta
      mac-command-modifier 'super)
;;;;; Window Resizing
(setq frame-resize-pixelwise t
      l (display-monitor-attributes-list)
      max-frame-width (nth 3 (nth 0 (nth 0 l)))
      max-frame-height (nth 4 (nth 0 (nth 0 l))))

(defun left-two-thirds ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) (- (* 2 (/ max-frame-width 3)) 20) max-frame-height t))

(defun left-one-thirds ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) (- (* 1 (/ max-frame-width 3)) 20) max-frame-height t))

(defun right-two-thirds ()
  (interactive)
  (set-frame-size (selected-frame) (- (* 2 (/ max-frame-width 3)) 17) max-frame-height t)
  (set-frame-position (selected-frame) (- (- (/ max-frame-width 3) 10) -10) 0))


(defun right-one-thirds ()
  (interactive)
  (set-frame-position (selected-frame) (* 2 (/ max-frame-width 3)) 0)
  (set-frame-size (selected-frame) (* 1 (/ max-frame-width 3)) max-frame-height t))

(defun center-third ()
  (interactive)
  (set-frame-position (selected-frame) (/ max-frame-width 3) 0)
  (set-frame-size (selected-frame) (- (* 1 (/ max-frame-width 3)) 20)  max-frame-height t))

(defun left-half ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) (- (* 1 (/ max-frame-width 2)) 20) max-frame-height t))

(defun right-half ()
  (interactive)
  (set-frame-position (selected-frame) (- (/ max-frame-width 2) 0) 0)
  (set-frame-size (selected-frame) (- (* 1 (/ max-frame-width 2)) 20) max-frame-height t))

(defun full-screen ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) (- (* 1 (/ max-frame-width 1)) 20) max-frame-height t))

(global-set-key (kbd "C-c w e") 'left-two-thirds)
(global-set-key (kbd "C-c w d") 'left-one-thirds)
(global-set-key (kbd "C-c w t") 'right-two-thirds)
(global-set-key (kbd "C-c w g") 'right-one-thirds)
(global-set-key (kbd "C-c w <left>") 'left-half)
(global-set-key (kbd "C-c w <right>") 'right-half)
(global-set-key (kbd "C-c w f") 'center-third)
(global-set-key (kbd "C-c w <return>") 'full-screen)

(full-screen)
