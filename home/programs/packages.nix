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
    osu-lazer
    prismlauncher
    gimp
    nautilus
    lmstudio
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
      # dev
      opencode
      gh
    ]) ++ device_conf;
}
