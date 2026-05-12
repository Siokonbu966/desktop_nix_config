{...}:
{
  imports = [
    ../programs/git.nix;
    ./packages.nix;
  ]

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
}
