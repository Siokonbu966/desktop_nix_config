{...}:
{
  imports = [
    ../programs/git.nix
    ../programs/nixvim
    ./packages.nix
    ./dotfiles.nix
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
}
