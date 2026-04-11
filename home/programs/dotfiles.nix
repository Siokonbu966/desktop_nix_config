{ my-dotfiles, ...}:

{
  xdg.configFile = {
    "nvim".source = "${my-dotfiles}/nvim";
    "kitty".source = "${my-dotfiles}/kitty";
    "fastfetch".source = "${my-dotfiles}/fastfetch";
    "ghostty".source = "${my-dotfiles}/ghostty";
    "picom".source = "${my-dotfiles}/picom.conf";
    "hypr".source = "${my-dotfiles}/hypr";
    "xremap".source = "${my-dotfiles}/xremap";
  };
  home.file = {
    ".p10.zsh".source = "${my-dotfiles}/.p10k.zsh";
  };
}
