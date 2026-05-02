{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages =
    (with pkgs; [
      # 25.05
      fastfetch
      tree
      btop
      tmux
      lua-language-server
      # dev
      opencode
      neovim
      gh
  ]);
}
