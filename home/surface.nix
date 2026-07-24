{
  imports = [
    ./programs/packages.nix
    ./programs/cli
    ./programs/nixvim
    ./programs/gui
    ./programs/utils
    ./programs/wm
    ./programs/obsidian.nix
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
}
