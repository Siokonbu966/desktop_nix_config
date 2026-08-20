{ pkgs, ... }:
{
  imports = [
    ./programs/nixvim
    # common
    ./programs/fastfetch
    ./programs/tree
    ./programs/btop
    ./programs/ghq
    ./programs/fzf
    ./programs/ripgrep
    ./programs/w3m
    ./programs/docker
    ./programs/colima
    ./programs/fontconfig
    # cli
    ./programs/git
    ./programs/opencode
    ./programs/direnv
    ./programs/tmux
    ./programs/zsh
    ./programs/nushell
    ./programs/herdr
    ./programs/yazi
    ./programs/gh
    ./programs/emacs
    # gui
    ./programs/fuzzel
    ./programs/obs
    ./programs/ghostty
    # utils
    ./programs/gtk
    ./programs/mako
    ./programs/udisk
    ./programs/dotfiles
    ./programs/default-app
    ./programs/nh
    # wm
    ./programs/waybar
    ./programs/swayidle
    ./programs/swaylock
    ./programs/niri
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;
}
