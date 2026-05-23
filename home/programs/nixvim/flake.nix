{
  description = "Nixvim config based on ./nvim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixvim, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
            "presence.nvim"
          ];
        };
        nixvim' = nixvim.legacyPackages.${system};
        configModule = import ./config.nix;
      in
      {
        packages.default = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = configModule;
        };
      });
}
