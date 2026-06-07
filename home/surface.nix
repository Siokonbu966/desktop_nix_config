{
  imports = [
    ./programs/packages.nix
    ./programs/cli
    ./programs/nixvim
    ./programs/gui
    ./programs/utils
    ./programs/wm
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
}
