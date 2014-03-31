;; Force Visual Line Mode with LaTeX 
(add-hook 'latex-mode-hook 'visual-line-mode)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-fill-mode nil)
 '(case-fold-search t)
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(delete-selection-mode nil nil (delsel))
 '(fill-column 7000)
 '(global-font-lock-mode t nil (font-lock))
 '(idlwave-auto-fill-split-string nil)
 '(idlwave-fill-comment-line-only nil)
 '(inhibit-startup-screen t)
 '(mark-even-if-inactive t)
 '(mouse-wheel-progressive-speed nil)
 '(scroll-bar-mode (quote right))
 '(scroll-conservatively 1000)
 '(show-paren-mode t nil (paren))
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(transient-mark-mode 1)
 '(truncate-lines t))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
