{...}: {
  imports = [
    ./programs/git.nix
    ./programs/packages.nix
    ./programs/dotfiles.nix
    ./programs/fuzzel.nix
    ./programs/udisk.nix
    ./programs/wm
    ./programs/mako.nix
    ./programs/zsh.nix
  ];

  home = rec {
    username = "crocus";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };
}
