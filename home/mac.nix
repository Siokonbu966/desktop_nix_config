{...}:
{
  imports = [
    ./programs/nixvim
    ./programs/cli
    ./programs/gui/ghostty.nix
    ./programs/utils/nh.nix
    ./programs/utils/dotfiles.nix
    ./programs/packages.nix
    ./programs/obsidian.nix
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/Users/${username}";
    stateVersion = "26.05";
  };
}
