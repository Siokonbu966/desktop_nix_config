(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
            (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
    'package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                        ("melpa" . "https://melpa.org/packages/")
                        ("org"   . "https://orgmode.org/elpa/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
        :ensure t
        :init
        (leaf hydra :ensure t)
        (leaf blackout :ensure t)

        :config
        (leaf-keywords-init)))

(leaf leaf
      :config
      (leaf leaf-convert :ensure t)
      (leaf leaf-tree
            :ensure t
            :custom ((imenu-list-size . 30)
                     (imenu-list-position . 'left))))

(leaf macrostep
      :ensure t
      :bind (("C-c e" . macrostep-expand)))

(leaf cus-edit
      :doc "tools for customizing Emacs and Lisp packages"
      :tag "builtin" "faces" "help"
      :custom `((custom-file . ,(locate-user-emacs-file "custom.el"))))

;;; ここに各自好きな設定を書く
(leaf doom-themes
      :doc "An opinionated pack of modern color-themes."
      :req "emacs-25.1" "cl-lib-0.5"
      :tag "faces" "themes" "emacs>=25.1"
      :url "https://github.com/doomemacs/themes"
      :ensure t
      :config
      (load-theme 'doom-dark+ t)
      (set-frame-parameter nil 'alpha 92))     

(set-frame-font "Gen Interface JP 18")

(provide 'init)
