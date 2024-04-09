(require 'evil)

(evil-mode 1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(evil-set-leader 'normal (kbd "SPC"))
(evil-define-key 'normal 'global (kbd "<leader>w") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>q") 'kill-emacs)
(evil-define-key 'normal 'global (kbd "<leader>x") 'save-buffers-kill-emacs)
(evil-define-key 'normal 'global (kbd "<leader>r") 'eval-buffer)
(evil-define-key 'normal 'global (kbd "<leader>e") (lambda () (interactive) (find-file "~/.emacs")))
(evil-define-key 'normal 'global (kbd "<leader>t") (lambda () (interactive) (find-file "~/splorg/agenda/tasks.org")))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
