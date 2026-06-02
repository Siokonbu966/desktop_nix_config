{...}:
{
  imports = [
    ./programs/nixvim
    ./programs/cli
    ./programs/utils/nh.nix
    ./programs/utils/dotfiles.nix
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/Users/${username}";
    stateVersion = "25.05";
  };
}
