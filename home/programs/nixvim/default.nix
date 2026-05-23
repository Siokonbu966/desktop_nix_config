{ nixvim-module, ... }:

{
  imports = [
    nixvim-module
  ];

  programs.nixvim = {
    enable = true;
    imports = [
      ./config.nix
    ];
  };
}
