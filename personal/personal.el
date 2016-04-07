;;(require 'redo)
(setq inhibit-eol-conversion 't)
(iswitchb-mode 1)             ;; better buffer switching
(setq iswitchb-buffer-ignore '("^ ")) ;; ignore " *Minibuf-1*"
(fringe-mode 1)               ;; (don't) get rid of that fringe boy!
(cond (window-system
       (scroll-bar-mode -1)   ;; stop terminals complaining
       )) 

;;;;;;;;;;;;;;;
;; VARIABLES ;;
;;;;;;;;;;;;;;;
;;(disable-theme 'zenburn)

(setq x-select-enable-clipboard t) ;; play nicely with cut/copy/paste into/out of emacs
(setq kill-whole-line t) ;; will make "ctrl-k" kill an entire line if the cursor is at the beginning of line
(setq case-fold-search t) ;; make searches case insensitive
(setq comment-multi-line t) ;; continue comment when line is wrapped
(setq inhibit-startup-message t) ;; don't show the gnu splash screen
(setq make-backup-files t) ;; do want to backup files
(setq next-line-add-newlines nil) ;; disallow new lines when you press the down arrow at end of the buffer
(setq require-final-newline t) ;; silently ensure newline at end of file
(setq search-highlight t) ;; highlight incremental search
(setq version-control t) ;; enable versioning with default values
(setq visible-bell t) ;; visual bell instead of annoying beep
(setq scroll-step 1) ;; do only one line scrolling
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/")))) ;; save all backup file in this directory.
(setq confirm-kill-emacs 'yes-or-no-p) ;; ask if I'm sure when quitting
;; (setq tramp-default-method "ssh") ;; tramp defaults
;; Ignore case when completing filenames
;;(setq completion-ignore-case t) ;; no!!!
(setq read-file-name-completion-ignore-case t) ;; yes!!!
(setq completion-ignored-extensions ;; ignore these file extensions as possible completions
      '(".o" "~"))
(setq frame-title-format ;; set title to show file name or buffer name
      '(buffer-file-name "%f" ("%b")))
(setq-default indent-tabs-mode nil) ;; don't insert tabs
(setq default-major-mode 'text-mode) ;; set major mode to text mode by default
;; n.b. display all faces: M-x list-faces-display
(cond (window-system
       (set-face-foreground 'minibuffer-prompt "white")
       (set-face-background 'fringe "white")
       ))
(fset 'yes-or-no-p 'y-or-n-p) ;; make all "yes or no" prompts show "y or n" instead
;; (setq-default fill-column 80) ;; the fill column influences how Emacs justifies paragraphs
;; (setq-default truncate-lines nil)
;; (set-fill-column 80)
;; (setq auto-fill-mode 1) ;; lines are automatically wrapped when the cursor goes beyond the column limit
;; (setq auto-save-default nil) ;; Don't want any auto saving
;; (setq modifier-keys-are-sticky t) ;; sticky modifier keys
;; (setq-default tab-width 4)

;; KEY BINDINGS

(defun goto-matching-paren-or-insert (arg)
  (interactive "p")
  (cond ((looking-at "[([{]") (forward-sexp 1) (backward-char))
	((looking-at "[])}]") (forward-char) (backward-sexp 1))
	(t (self-insert-command (or arg 1)))))

(defun scroll-up-fixed-point ()
  (interactive) (scroll-up 1)
  (forward-line 1))

(defun scroll-down-fixed-point ()
  (interactive) (scroll-down 1)
  (forward-line -1))

(global-set-key "\C-j" 'comment-or-uncomment-region)
(global-set-key "\C-q" 'copy-region-as-kill)

;;(global-set-key "\M-_" 'redo)

(global-set-key "\M-g" 'goto-line)

(global-set-key "\M-m" 'scroll-up-fixed-point)
(global-set-key "\M-o" 'scroll-down-fixed-point)

(global-set-key "\M-n" 'forward-paragraph)
(global-set-key "\M-p" 'backward-paragraph)

(global-set-key "\M-r" 'replace-regexp)
(global-set-key "\M-s" 'replace-string)

(global-set-key "!" 'goto-matching-paren-or-insert)

(global-set-key [(shift up)] 'scroll-down-fixed-point)
(global-set-key [(shift down)] 'scroll-up-fixed-point)

;; Let Emacs type pairs of parens
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)
;;(global-set-key "<" 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "'") 'skeleton-pair-insert-maybe)
(setq skeleton-pair t)

;; ON EXIT

;; Save current emacs session
(desktop-load-default)
(desktop-save-mode 1)
;; (desktop-read)
