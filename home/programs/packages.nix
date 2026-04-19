{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages =
    (with pkgs; [
      # 25.05
      ghostty
      kitty
      fastfetch
      tree
      wl-clipboard
      slurp
      btop
      tmux
      lua-language-server
      luarocks
      marksman
      nil
      gnumake
      pipewire
      wireplumber
      waybar
      grim
      mako
      libnotify
      xremap
      zsh-powerlevel10k
      # desktop client
      obsidian
      obs-studio
      vesktop
      nemo-with-extensions
      pavucontrol
      realvnc-vnc-viewer
      kdePackages.falkon
      vlc
      # sway
      swaybg
      swayr
      # hyprland
      wofi
      alacritty
      # niri
      niri
      # dev
      opencode
      pnpm
      nodejs_24
      gcc
      python3
      typescript
      lua
      neovim
      clang-tools
      gh
  ]);
}
