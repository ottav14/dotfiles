(require 'evil)

(evil-mode 1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Evil leader key
(evil-set-leader 'normal (kbd "SPC"))

;; Global binds
(evil-define-key 'normal 'global (kbd "<leader>w") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>q") 'kill-emacs)
(evil-define-key 'normal 'global (kbd "<leader>x") 'save-buffers-kill-emacs)
(evil-define-key 'normal 'global (kbd "<leader>r") 'eval-buffer)
(evil-define-key 'normal 'global (kbd "<leader>f") 'find-file)
(evil-define-key 'normal 'global (kbd "<leader>b") 'switch-to-buffer)
(evil-define-key 'normal 'global (kbd "<leader>e") (lambda () (interactive) (find-file "~/dotfiles/.emacs")))
(evil-define-key 'normal 'global (kbd "<leader>t") (lambda () (interactive) (find-file "~/splorg/agenda/tasks.org")))


;; Org mode binds
(add-hook 'org-mode-hook (lambda () (interactive) 
                           (evil-define-key 'normal 'global (kbd "TAB") 'org-cycle)
                           (evil-define-key 'normal 'global (kbd "<leader>SPC") 'org-todo)))

;; TeX binds
(add-hook 'LaTeX-mode-hook (lambda () (interactive)
                           (evil-define-key 'normal 'global (kbd "<leader>l") (lambda () (interactive)
										(save-buffer)
										(TeX-command "LaTeX" 'TeX-master-file)))))
;; Turn off backups
(setq make-backup-files nil)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Zathura")
     (output-html "xdg-open")))
 '(display-line-numbers 'relative)
 '(package-selected-packages '(auctex evil))
 '(truncate-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
