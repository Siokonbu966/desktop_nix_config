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
      nil
      gnumake
      pipewire
      wireplumber
      grim
      mako
      xremap
      zsh-powerlevel10k
      ghq
      fzf
      # utils
      usbutils
      # desktop client
      obsidian
      vesktop
      slack
      pavucontrol
      realvnc-vnc-viewer
      kdePackages.falkon
      vlc
      anki
      google-chrome
      zed-editor
      osu-lazer
      prismlauncher
      gimp
      nautilus
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
      gh
    ]);
}
