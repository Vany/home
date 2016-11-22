(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'perltidy)
(require 'package)
(package-initialize)
(with-eval-after-load 'go-mode (require 'go-autocomplete))

(defalias 'perl-mode 'cperl-mode)
(defalias 'yes-or-no-p 'y-or-n-p)
(add-to-list 'auto-mode-alist '("\\.tt\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.plx\\'" . cperl-mode))

(yas-global-mode 1)
(put 'upcase-region 'disabled nil)
(ido-mode 'buffer)

(global-set-key (kbd "<C-tab>") 'indent-region)
(global-set-key (kbd "C-$")   'perltidy-region)
(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "C-%") 'delete-trailing-whitespace)
;; C-x buffer/window like aliases
(global-set-key (kbd "M-o") 'other-window)
;; bargain style templates
(global-set-key (kbd "C-S-d") "use Data::Dumper; warn Dumper();")
(global-set-key (kbd "C-S-l") "use Data::Dumper;Panda::Log->warn((caller(0))[3].':'.__LINE__.'  '.Dumper( ));")
(global-set-key (kbd "C-~") "$DB::single=1;\n")

(add-hook 'go-mode-hook
          (lambda ()
            (push '("func" . ?ƒ) prettify-symbols-alist)
            (prettify-symbols-mode)
            (auto-complete-mode 1)
            (local-set-key (kbd "<f5>") 'compile)
            ))
(cust
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "red" "green" "yellow" "blue" "magenta" "cyan" "white"])
 '(cperl-electric-keywords t)
 '(cperl-electric-parens nil)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(custom-enabled-themes (quote (misterioso)))
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(indent-tabs-mode nil)
 '(menu-bar-mode nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(pc-selection-mode t)
 '(safe-local-variable-values (quote ((c-indentation-style . bsd))))
 '(savehist-mode t)
 '(show-paren-delay 0.2)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-verbose 1)
 '(term-default-bg-color nil)
 '(term-default-fg-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#101720" :foreground "#e1e1e0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "unknown" :family "Ubuntu Mono"))))
 '(cperl-array-face ((t (:foreground "yellow" :weight bold))))
 '(cperl-hash-face ((t (:foreground "Red" :slant italic :weight bold))))
 '(hl-line ((t (:background "#202730")))))



(require 'localconfig)
(server-start)


(defun lastkeys() (interactive) "Suddenly learned keys" (message "
| keys                 | function                       | description                                |
|----------------------+--------------------------------+--------------------------------------------|
| C-x C-+ and  C-x C-- | text-scale-adjust              | make font bigger/smaller in current buffer |
| C-M-n and C-M-p      | forward-list and backward-list | jump balanced parentheses                  |
"))
