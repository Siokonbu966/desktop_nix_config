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
      ghq
      fzf
      # utils
      usbutils
      # desktop client
      obsidian
      obs-studio
      vesktop
      slack
      nemo-with-extensions
      pavucontrol
      realvnc-vnc-viewer
      kdePackages.falkon
      vlc
      anki
      google-chrome
      zed-editor
      osu-lazer
      prismlauncher
      # sway
      swaybg
      swayr
      swaylock
      swayidle
      # hyprland
      wofi
      alacritty
      # niri
      niri
      # dev
      opencode
      gh
    ]);
}
