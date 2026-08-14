{pkgs, ...}: {
  home.packages = [
    (pkgs.emacs.override { withNativeCompilation = false; })
  ];
}
