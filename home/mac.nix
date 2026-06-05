{...}:
{
  imports = [
    ./programs/nixvim
    ./programs/cli
    ./programs/gui/ghostty.nix
    ./programs/utils/nh.nix
    ./programs/utils/dotfiles.nix
    ./programs/packages.nix
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/Users/${username}";
    stateVersion = "25.05";
  };
}
