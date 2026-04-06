{ my-dotfiles, ...}:

{
  xdg.configFile."nvim".source = "${my-dotfiles}/nvim";
  xdg.configFile."kitty".source = "${my-dotfiles}/kitty";
  xdg.configFile."fastfetch".source = "${my-dotfiles}/fastfetch";
  xdg.configFile."ghostty".source = "${my-dotfiles}/ghostty";
  xdg.configFile."picom".source = "${my-dotfiles}/picom.conf";
  xdg.configFile."hypr".source = "${my-dotfiles}/hypr";
  xdg.configFile."xremap".source = "${my-dotfiles}/xremap";
}
