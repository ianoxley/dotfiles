;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ian Oxley"
      user-mail-address "ijoxley@gmail.com")

(setq doom-font (font-spec :family "Ubuntu Mono" :size 20))
(setq-default mac-command-modifier 'meta)
(setq-default mac-option-modifier nil)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(use-package! org
  :config
  (setq org-directory "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org")
  (setq org-agenda-files (list "~/Library/Mobile Documents/com~apple~CloudDocs/org/todo.org"
                                  "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/home.org"
                                  "~/Library/Mobile Documents/com~apple~CloudDocs/org/work.org"
                                  "~/Library/Mobile Documents/com~apple~CloudDocs/org/notes.org"))
  (setq org-archive-location "%s_archive::datetree/*")

  (setq org-log-done 'time)
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  '(org-startup-truncated nil)

  (setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELLED(c@)")))
  (setq org-tag-alist '(("work" . ?w) ("home" . ?h) ("diy" . ?d) ("errands" . ?e)))

  (setq org-default-notes-file "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/notes.org")
  (define-key global-map "\C-cc" 'org-capture)

  ;; org mode capture templates
  (setq org-capture-templates
          '(("t" "Todo" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org" "Tasks")
      "* TODO %?\n %i\n %a")
          ("j" "Journal" entry (file+datetree "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/journal.org")
      "* %?\nEntered on %U\n %i\n %a")))

  (setq org-global-properties
        '(("Effort_ALL" .
           "0:15 0:30 0:45 1:00 1:30 2:00 3:00 4:00 5:00 0:00")))
  (setq org-columns-default-format "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM")

  (custom-set-variables
    '(org-agenda-show-all-dates t)
    '(org-agenda-skip-deadline-if-done t)
    '(org-agenda-skip-scheduled-if-done t)
    '(org-deadline-warning-days 14)
    '(org-reverse-note-order t)
    ))

(setq
 auto-mode-alist (append '(("Dockerfile.*\\'" . dockerfile-mode)) auto-mode-alist)
 projectile-project-search-path '("~/dev/" "~/play"))
(setq display-line-numbers 'relative)

; (def-package! org-super-agenda
;   :after org-agenda
;   :init
;   (setq org-super-agenda-groups '((:name "Today"
;                                          :time-grid t
;                                          :scheduled today)
;                                   (:name "Due Today"
;                                          :deadline today)
;                                   (:name "Important"
;                                          :priority "A")
;                                   (:name "Overdue"
;                                          :deadline past)
;                                   (:name "Upcoming"
;                                          :deadline future)
;                                   (:name "Personal"
;                                          :tag ("home" "personal"))))
;   :config
;   (org-super-agenda-mode)
;   )
