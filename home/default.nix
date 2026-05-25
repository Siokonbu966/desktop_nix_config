{...}: {
  imports = [
    ./programs/packages.nix
    ./programs/dotfiles.nix
    ./programs/fuzzel.nix
    ./programs/udisk.nix
    ./programs/wm
    ./programs/zsh.nix
    ./programs/ghostty.nix
    ./programs/nixvim
    ./programs/gui
    ./programs/dev
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;
}
