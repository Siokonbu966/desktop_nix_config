{ my-dotfiles, ...}:

{
  xdg.configFile = {
    "nvim".source = "${my-dotfiles}/nvim";
    "kitty".source = "${my-dotfiles}/kitty";
    "fastfetch".source = "${my-dotfiles}/fastfetch";
  };
  home.file = {
    ".bashrc".source = "${my-dotfiles}/.bashrc";
  };
}
