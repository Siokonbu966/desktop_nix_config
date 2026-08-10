{ user_name, ... }:
{
  imports = [
    ./programs/nixvim
    ./programs/cli
    ./programs/utils/nh.nix
    ./programs/utils/dotfiles.nix
    ./programs/packages.nix
  ];

  home = rec {
    username = "${user_name}";
    homeDirectory = "/Users/${username}";
    stateVersion = "26.05";
  };
}
