{...}:
{
  imports = [
    ../programs/git.nix
    ./packages.nix
    ./dotfiles.nix
    ./bash.nix
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
}
