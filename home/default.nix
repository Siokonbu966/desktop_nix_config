{...}: {
  imports = [
    ./programs/git.nix
    ./programs/packages.nix
    ./programs/dotfiles.nix
    ./programs/fuzzel.nix
    ./programs/wm/waybar.nix
    ./programs/wm/sway.nix
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
}
