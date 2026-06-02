{...}:
{
  imports = [
    ./programs/cli
    ./programs/nixvim
    ./programs/packages.nix
    ./programs/utils/dotfiles.nix
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
}
