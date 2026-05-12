{ my-dotfiles, ...}:

{
  xdg.configFile = {
    "nvim".source = "${my-dotfiles}/nvim";
    "kitty".source = "${my-dotfiles}/kitty";
    "fastfetch".source = "${my-dotfiles}/fastfetch";
    "picom".source = "${my-dotfiles}/picom.conf";
    "niri".source = ../../configs/niri;
  };
  home.file = {
    ".p10k.zsh".source = "${my-dotfiles}/.p10k.zsh";
    ".bashrc".source = "${my-dotfiles}/.bashrc";
  };
}
