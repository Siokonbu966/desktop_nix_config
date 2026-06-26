{...}: {
  imports = [
    ./programs/packages.nix
    ./programs/utils
    ./programs/wm
    ./programs/nixvim
    ./programs/gui
    ./programs/cli
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;
}
