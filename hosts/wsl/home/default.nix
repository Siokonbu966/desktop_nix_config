{...}: {
  imports = [
    ./programs/git.nix
    ./programs/packages.nix
    ./programs/dotfiles.nix
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
}
