{...}:
{
  imports = [
    ./programs/nixvim
    ./programs/cli
    ./programs/gui/ghostty.nix
    ./programs/omniwm.nix
    ./programs/utils/nh.nix
    ./programs/utils/dotfiles.nix
    ./programs/packages.nix
    ./programs/obsidian.nix
  ];

  programs.omniwm = {
    enable = true;
    settings = {
      general = {
        updateChecksEnabled = false;
      };
    };
  };

  home = rec {
    username = "crocus";
    homeDirectory = "/Users/${username}";
    stateVersion = "26.05";
  };
}
