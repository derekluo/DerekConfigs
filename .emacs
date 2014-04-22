(require 'package)
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;========================================
;; start the emacsserver that listens to emacsclient
(server-start)

(unless (package-installed-p 'popup)
  (package-install 'popup))

(unless (package-installed-p 'ruby-mode)
  (package-install 'ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))

(unless (package-installed-p 'inf-ruby)
  (package-install 'inf-ruby))

(unless (package-installed-p 'ac-inf-ruby)
  (package-install 'ac-inf-ruby))

(unless (package-installed-p 'rinari)
  (package-install 'rinari))
(global-rinari-mode)

(unless (package-installed-p 'rvm)
  (package-install 'rvm))
(require 'rvm)
(rvm-use-default)

(unless (package-installed-p 'ruby-electric)
  (package-install 'ruby-electric))
(defun ruby-insert-end () 
  "Insert \"end\" at point and reindent current line." 
  (interactive) 
  (insert "end") 
  (ruby-indent-line t) 
  (end-of-line))

;;(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(unless (package-installed-p 'ruby-dev)
  (package-install 'ruby-dev))

(unless (package-installed-p 'ruby-block)
  (package-install 'ruby-block))

(unless (package-installed-p 'ruby-refactor)
  (package-install 'ruby-refactor))

(unless (package-installed-p 'robe)
  (package-install 'robe))

(unless (package-installed-p 'python-mode)
  (package-install 'python-mode))

(unless (package-installed-p 'ipython)
  (package-install 'ipython))

(unless (package-installed-p 'python-pylint)
  (package-install 'python-pylint))

(unless (package-installed-p 'pysmell)
  (package-install 'pysmell))

(unless (package-installed-p 'exec-path-from-shell)
  (package-install 'exec-path-from-shell))
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(unless (package-installed-p 'jedi)
  (package-install 'jedi))

(defun my-jedi-setup ()
  (auto-complete-mode 1)
  (setq jedi:complete-on-dot t)
  (setq jedi:setup-keys t)
  (require 'jedi)
  (jedi:setup))
(add-hook 'python-mode-hook 'my-jedi-setup)

(unless (package-installed-p 'anything-ipython)
  (package-install 'anything-ipython))

;;(unless (package-installed-p 'rhtml-mode)
;;  (package-install 'rhtml-mode))

(unless (package-installed-p 'rspec-mode)
  (package-install 'rspec-mode))

(unless (package-installed-p 'feature-mode)
  (package-install 'feature-mode))
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(unless (package-installed-p 'scss-mode)
  (package-install 'scss-mode))
(setq scss-compile-at-save nil)

(unless (package-installed-p 'web-mode)
  (package-install 'web-mode))
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(unless (package-installed-p 'emmet-mode)
  (package-install 'emmet-mode))

(add-hook 'web-mode-hook 'emmet-mode) ;;

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(safe-local-variable-values (quote ((encoding . utf-8) (ruby-compilation-executable . "ruby") (ruby-compilation-executable . "ruby1.8") (ruby-compilation-executable . "ruby1.9") (ruby-compilation-executable . "rbx") (ruby-compilation-executable . "jruby"))))
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Monaco")))))

(setq inhibit-splash-screen t)

;; ========== Prevent Emacs from making backup files ==========
(setq make-backup-files nil) 

;; ========== Line by line scrolling ========== 

;; This makes the buffer scroll by only a single line when the up or
;; down cursor keys push the cursor (tool-bar-mode) outside the
;; buffer. The standard emacs behaviour is to reposition the cursor in
;; the center of the screen, but this can make the scrolling confusing
(setq scroll-step 1)

;; ===== Set standard indent to 2 rather that 4 ====
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; ========== Prevent Emacs from making backup files ==========
(setq make-backup-files nil) 

(require 'ido)
(ido-mode t)


;; replace locate by spotlight
(setq locate-command "mdfind")

(defun maximize-frame () 
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))

(maximize-frame)

;; yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)
(setq yas/snippet-dirs "~/.emacs.d/plugins/yasnippet/snippets")
(setq yas/triggers-in-field t)

;; auto-complete
(add-to-list 'load-path "/Users/derek/.emacs.d/")
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/derek/.emacs.d/ac-dict")
(ac-config-default)
 
(setq-default ac-sources '(ac-source-yasnippet    
			   ac-source-semantic  
			   ac-source-ropemacs  
			   ac-source-imenu    
			   ac-source-words-in-buffer  
			   ac-source-dictionary  
			   ac-source-abbrev    
			   ac-source-words-in-buffer    
			   ac-source-files-in-current-dir    
			   ac-source-filename))   
  
(add-hook 'emacs-lisp-mode-hook    (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
  
(set-face-background 'ac-candidate-face "lightgray")  
(set-face-underline 'ac-candidate-face "darkgray")  
(set-face-background 'ac-selection-face "steelblue")   
  
(setq ac-auto-start 2)  
(setq ac-dwim t)  

(require 'highline)
(defun highline-mode-on () (highline-mode 1))
;; Turn on local highlighting for Dired (C-x d)
(add-hook 'dired-after-readin-hook #'highline-mode-on)
;; Turn on local highlighting for list-buffers (C-x C-b)
(defadvice list-buffers (after highlight-line activate)
  (save-excursion
    (set-buffer "*Buffer List*")
    (highline-mode-on)))

;; To customize the background color
(set-face-background 'highline-face "#330")

;;以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)
;;在标题栏显示buffer的名字(默认不显示)
(setq frame-title-format "%b@emacs")
;;关闭自动保存模式
;(setq auto-save-mode nil)
;;不生成 #filename# 临时文件
(setq auto-save-default nil)
;;自动的在文件末增加一新行
(setq require-final-newline t)
;;当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

;;在模式栏中显示当前光标所在函数
(which-function-mode)

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

(custom-set-variables
 '(comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
 '(comint-scroll-to-bottom-on-output t) ; always add output at the bottom
 '(comint-scroll-show-maximum-output t) ; scroll to show max possible output
 '(comint-completion-autolist t)        ; show completion list when ambiguous
 '(comint-input-ignoredups t)           ; no duplicates in command history
 '(comint-completion-addsuffix t)       ; insert space/slash after file completion
 )

; interpret and use ansi color codes in shell output windows
(ansi-color-for-comint-mode-on)

(setq python-shell-interpreter "ipython")
(require 'rscope)

(tool-bar-mode -1)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
