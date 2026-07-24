{...}: {
  imports = [
    ./programs/packages.nix
    ./programs/utils
    ./programs/wm
    ./programs/nixvim
    ./programs/gui
    ./programs/cli
    ./programs/obsidian.nix
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;
}
