{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages =
    (with pkgs; [
      # 25.05
      neovim
      ghostty
      kitty
      fastfetch
      tree
      gh
      wl-clipboard
      btop
      tmux
      gcc
      python3
      typescript
      lua
      luarocks
      gnumake
      nodejs_24
      pipewire
      wireplumber
      waybar
      grim
      mako
      # desktop client
      obsidian
      obs-studio
      discord
    ]);
}
