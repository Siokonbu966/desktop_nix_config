{pkgs, ...}: {
  home.packages = [
    (pkgs.emacs.override { withNativeCompilation = false; })
  ];

  home.file = {
    ".emacs.d/init.el".source = ../../../configs/emacs/init.el;
  };
}
