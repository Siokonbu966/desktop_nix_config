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
      slurp
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
      libnotify
      xremap
      github-copilot-cli
      zsh-powerlevel10k
      # desktop client
      obsidian
      obs-studio
      vesktop
      nemo-with-extensions
      pavucontrol
      realvnc-vnc-viewer
      kdgPackages.falkon
      vlc
      swaybg
  ]);
}
