{...}: {
  imports = [
    ./programs/packages.nix
    ./programs/dotfiles.nix
    ./programs/udisk.nix
    ./programs/wm
    ./programs/nixvim
    ./programs/gui
    ./programs/dev
    ./programs/terminal
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;
}
