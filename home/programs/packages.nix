{ device ? "wsl", pkgs, ... }:
let
  device_conf = if device == "desktop" then (with pkgs; [
    ghostty
    kitty
    slurp
    nil
    gnumake
    # utils
    usbutils
    mako
    pipewire
    wireplumber
    grim
    wl-clipboard
    xremap
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
    vscodium
    osu-lazer
    prismlauncher
    gimp
    nautilus
    lmstudio
    signal-desktop
    qtractor
    lmms
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
  ]) else if device == "surface" then (with pkgs; [
    ghostty
    slurp
    nil
    gnumake
    # utils
    usbutils
    mako
    pipewire
    wireplumber
    grim
    wl-clipboard
    xremap
    # desktop client
    obsidian
    pavucontrol
    realvnc-vnc-viewer
    kdePackages.falkon
    vlc
    zed-editor
    nautilus
    # sway
    swaybg
    swayr
    swaylock
    swayidle
  ]) else [];
in
{
  fonts.fontconfig.enable = true;
  home.packages =
    (with pkgs; [
      fastfetch
      tree
      btop
      tmux
      ghq
      fzf
      ripgrep
      docker
      docker-compose
      colima
    ]) ++ device_conf;
}
