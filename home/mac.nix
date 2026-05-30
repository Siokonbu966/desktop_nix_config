{...}:
{
  imports = [
    ./programs/dev
    ./programs/nixvim
    ./programs/terminal
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/Users/${username}";
    stateVersion = "25.05";
  };
}
