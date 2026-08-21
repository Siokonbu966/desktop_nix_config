{pkgs, ...}: {
  home.packages = [
    (pkgs.emacs.override { withNativeCompilation = false; })
  ];

  home.file = {
    ".emacs.d/init.el".source = ../../../configs/emacs/init.el;
    ".emacs.d/init/40-markdown-mode.el".source = ../../../configs/emacs/40-markdown-mode.el;
  };
}
