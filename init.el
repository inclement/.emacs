(add-to-list 'load-path "~/.emacs.d/misc_lisp")

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)

(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))
(define-key global-map "\M-Q" 'unfill-paragraph)

; Useful modes
(show-paren-mode 1)
(column-number-mode 1)

; Use mail mode with mutt
(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist))

; Do tabs right
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

; Do backups sensibly
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

; ido-mode
;; (require 'ido)
;; (ido-mode t)


; kivy-mode
(require 'kivy-mode)
(add-to-list 'auto-mode-alist '("\\.kv$" . kivy-mode))
(add-hook 'kivy-mode-hook
          '(lambda ()
             (define-key kivy-mode-map "\C-m" 'newline-and-indent)))

; load octave mode
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))


;; ; auctex
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
;;   (require 'tex)
;;(TeX-global-PDF-mode t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

; julia-mode
(require 'julia-mode)

; cython-mode
(require 'cython-mode)

; python-mode
;; (add-to-list 'load-path "/home/asandy/.emacs.d/python-mode.el-6.1.3/") 
;; (setq py-install-directory "/home/asandy/.emacs.d/python-mode.el-6.1.3/") 
;; (require 'python-mode)
(add-to-list 'load-path "/home/asandy/devel/python-mode/") 
(setq py-install-directory "/home/asandy/devel/python-mode/")
(require 'python-mode)
(setq py-shell-name "ipython")


; evil-mode
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
(add-to-list 'evil-insert-state-modes 'git-commit-mode)
(evil-ex-define-cmd "W" 'save-buffer)

(when (> emacs-major-version 23)
        (require 'package)
        (package-initialize)
        (add-to-list 'package-archives 
                     '("melpa" . "http://melpa.milkbox.net/packages/")
                     'APPEND))

; glsl-mode
(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))

; magit key
(global-set-key [f1] 'magit-status)

;; change mode-line color by evil state
;; (lexical-let ((default-color (cons (face-background 'mode-line)
;; 				   (face-foreground 'mode-line))))
;;   (add-hook 'post-command-hook
;; 	    (lambda ()
;; 	      (let ((color (cond ((minibufferp) default-color)
;; 				 ((evil-insert-state-p) '("#e80000" . "#ffffff"))
;; 				 ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
;; 				 ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
;; 				 (t default-color))))
;; 		(set-face-background 'mode-line (car color))
;; 		(set-face-foreground 'mode-line (cdr color))))))



; Make hjkl sensible on colemak
(defun to-colemak () 
  (interactive)
;  (define-key evil-normal-state-map "l" 'evil-search-next)
  (define-key evil-normal-state-map "l" 'evil-insert)
  (define-key evil-normal-state-map "j" 'evil-forward-word-end)
;  (define-key evil-normal-state-map "k" 'evil-insert)
  (define-key evil-normal-state-map "k" 'evil-search-next)
  (define-key evil-normal-state-map "n" 'evil-next-line)
  (define-key evil-normal-state-map "e" 'evil-previous-line)
  (define-key evil-normal-state-map "i" 'evil-forward-char)
;  (define-key evil-visual-state-map "l" 'evil-search-next)
  (define-key evil-visual-state-map "l" 'evil-insert)
  (define-key evil-visual-state-map "j" 'evil-forward-word-end)
;  (define-key evil-visual-state-map "k" 'evil-insert)
  (define-key evil-visual-state-map "k" 'evil-search-next)
  (define-key evil-visual-state-map "n" 'evil-next-line)
  (define-key evil-visual-state-map "e" 'evil-previous-line)
  (define-key evil-visual-state-map "i" 'evil-forward-char))
(defun to-qwerty ()
  (interactive)
  (define-key evil-normal-state-map "n" 'evil-search-next)
  (define-key evil-normal-state-map "e" 'evil-forward-word-end)
  (define-key evil-normal-state-map "i" 'evil-insert)
  (define-key evil-normal-state-map "j" 'evil-next-line)
  (define-key evil-normal-state-map "k" 'evil-previous-line)
  (define-key evil-normal-state-map "l" 'evil-forward-char)
  (define-key evil-visual-state-map "n" 'evil-search-next)
  (define-key evil-visual-state-map "e" 'evil-forward-word-end)
  (define-key evil-visual-state-map "i" 'evil-insert)
  (define-key evil-visual-state-map "j" 'evil-next-line)
  (define-key evil-visual-state-map "k" 'evil-previous-line)
  (define-key evil-visual-state-map "l" 'evil-forward-char))

(to-colemak)

; Smooth scrolling when moving cursor
(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
    (setq-default scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

(semantic-mode 1)

(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
;;(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h o") 'helm-occur)
;(global-set-key (kbd "C-c h o") 'helm-swoop)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(helm-mode 1)
(require 'helm-projectile)
(helm-projectile-on)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-action)
(define-key helm-map (kbd "C-e") 'helm-previous-line)
(define-key helm-map (kbd "C-h") 'helm-find-files-up-one-level)
;(define-key helm-map (kbd "C-x C-f") 'helm-find-files)

(define-key evil-normal-state-map "m" nil)
(define-key evil-motion-state-map "mx" 'helm-M-x)
(define-key evil-motion-state-map "ms" 'helm-semantic-or-imenu)
(define-key evil-motion-state-map "mt" 'helm-command-prefix)
(define-key evil-motion-state-map "mv" 'magit-status)
(define-key evil-motion-state-map "mf" 'find-file)
(define-key evil-motion-state-map "mb" 'helm-mini)
(define-key evil-motion-state-map "mr" 'helm-resume)


(define-key evil-motion-state-map "mo" 'helm-swoop)


(define-key evil-motion-state-map "mp" 'projectile-command-map)


(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-file-exists-remote-cache-expire nil)


(add-hook 'after-init-hook #'global-flycheck-mode)
(define-key evil-motion-state-map "mc" nil)
(define-key evil-motion-state-map "mcc" 'flycheck-buffer)
(define-key evil-motion-state-map "mct" 'flycheck-mode)
(define-key evil-motion-state-map "mch" 'helm-flycheck)
(define-key evil-motion-state-map "mce" 'flycheck-list-errors)
(define-key evil-motion-state-map "mcn" 'flycheck-next-error)
(define-key evil-motion-state-map "mcp" 'flycheck-previous-error)
(define-key evil-motion-state-map "mcf" 'flycheck-first-error)

;; (set-default-font "Inconsolata-12")
;; (set-default-font "Bitstream Vera Sans Mono 11")
;; (set-default-font "Bitstream Vera Sans Mono 10")
;; (set-default-font "Dejavu Sans Mono 11")
(set-default-font "Dejavu Sans Mono-10")
(add-to-list 'default-frame-alist
             '(font . "Dejavu Sans Mono-10"))

(require 'undo-tree)
(global-undo-tree-mode)
(define-key evil-motion-state-map "mu" 'undo-tree-visualize)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)    

(sml/setup)
;(setq sml/theme 'automatic)

(nyan-mode)


(set-face-attribute 'default nil :height 100)

; uniqify buffer names
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(py-set-fill-column-p t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

