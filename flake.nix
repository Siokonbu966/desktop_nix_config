{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    my-dotfiles = {
      url = "github:Siokonbu966/dotfiles";
      flake = false;
    };
    xremap-flake.url = "github:Siokonbu966/dotfiles";
  };

  outputs = { self, nixpkgs, home-manager, my-dotfiles, ... }@inputs: {
    nixosConfigurations = {
      nixos = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          inputs.xremap-flake.nixosModules.default
          ./modules/xremap.nix

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit my-dotfiles; };
              users.crocus = import ./home;
            };
          }
        ];
      };
    };
  };
}
