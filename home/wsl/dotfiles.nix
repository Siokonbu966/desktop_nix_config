{ my-dotfiles, ...}:

{
  xdg.configFile = {
    "fastfetch".source = "${my-dotfiles}/fastfetch";
  };
  home.file = {
    ".bashrc".source = ../../configs/bash/.bashrc;
  };
}
