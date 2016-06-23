(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/yasnippet")
(add-to-list 'load-path "~/.emacs.d/lisp/go-mode.el")
(add-to-list 'load-path "~/.emacs.d/lisp/php-mode")
(add-to-list 'load-path "~/.emacs.d/lisp/web-mode")
(add-to-list 'load-path "~/.emacs.d/lisp/csharp-mode")
(require 'web-mode)
(require 'yasnippet)
(require 'go-mode-autoloads)
(require 'csharp-mode)
;;(eval-after-load 'php-mode '(require 'php-ext))
(add-to-list 'auto-mode-alist '("\\.tt\\'" . web-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "red" "green" "yellow" "blue" "magenta" "cyan" "white"])
 '(cperl-electric-parens nil)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(custom-enabled-themes (quote (misterioso)))
 '(global-hl-line-mode t)
 '(indent-tabs-mode nil)
 '(menu-bar-mode nil)
 '(pc-selection-mode t)
 '(safe-local-variable-values (quote ((c-indentation-style . bsd))))
 '(show-paren-delay 0)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(savehist-mode t)
 '(global-linum-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#101720" :foreground "#e1e1e0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "unknown" :family "Ubuntu Mono"))))
 '(cperl-array-face ((t (:foreground "yellow" :weight bold))))
 '(cperl-hash-face ((t (:foreground "Red" :slant italic :weight bold))))
 '(hl-line ((t (:background "#202730")))))
(setq tramp-verbose 10)

(yas-global-mode 1)




(put 'upcase-region 'disabled nil)

(setq term-default-bg-color nil)
(setq term-default-fg-color nil)

(require 'perltidy)
(defalias 'perl-mode 'cperl-mode)
(setq cperl-electric-keywords t)

(require 'ido)
(ido-mode 'buffer)



(global-set-key (kbd "<C-tab>") 'indent-region)
(global-set-key (kbd "C-S-d") "use Data::Dumper; warn Dumper();")
(global-set-key (kbd "C-S-l") "use Data::Dumper;Panda::Log->warn((caller(0))[3].':'.__LINE__.'  '.Dumper( ));")
(global-set-key (kbd "C-S-s") "sub {\n\tmy ($self, ) = @_; \n}")
(global-set-key (kbd "C-~") "$DB::single=1;\n")
(global-set-key (kbd "C-$")   'perltidy-region)
(global-set-key (kbd "<f9>") 'touch-catalyst)
(global-set-key (kbd "C-%") 'delete-trailing-whitespace)
(defalias 'yes-or-no-p 'y-or-n-p)



;; (defun highlight-publish_notification()
;;   "highlighht"
;;   (highlight-regexp "publish_notification"  "hi-green")
;;   )

;;     )
;; (global-set-key (kbd "C-#") 'highlight-publish_notification)

;; (defun touch-catalyst ()
;;   "call local instamnce of catalyst"
;;   (interactive)
;;   (shell-command-to-string "wget -O - http://localhost:3000/ua/index"))

;; (defun emacsgrep (args)
;;   "Run fancy grep"
;;   (interactive "Mgrep: ")
;;   (let (buff (get-buffer-create " *emacsgrep* "))
;;     (switch-to-buffer buff)
;;     (shell-command (concat "emacsgrep" " " args) buff)
;;     (set-auto-mode)
;;     ))
;; (put 'erase-buffer 'disabled nil)


(server-start)
