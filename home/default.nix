{...}: {
  imports = [
    ./programs/packages.nix
    ./programs/utils
    ./programs/wm
<<<<<<< Updated upstream
    ./programs/nixvim
    ./programs/gui
    ./programs/cli
=======
    ./programs/mako.nix
    ./programs/zsh.nix
    # ./programs/noctalia.nix
    ./programs/default-app.nix
    ./programs/ghostty.nix
    ./programs/gtk.nix
>>>>>>> Stashed changes
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;
}
