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
    xremap-flake.url = "github:xremap/nix-flake";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, my-dotfiles, ... }@inputs: {
    nixosConfigurations = {
      surface = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/surface
          inputs.xremap-flake.nixosModules.default
          ./modules/xremap

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit my-dotfiles; };
              users.crocus = {
                imports = [
                  ./home
                  ./hosts/surface/home
                ];
              };
            };
          }
        ];
      };

      desktop = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/desktop
          ./nvidia
          inputs.xremap-flake.nixosModules.default
          ./modules/xremap

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit my-dotfiles; };
              users.crocus = {
                imports = [
                  ./home
                  ./hosts/desktop/home
                ];
              };
            };
          }
        ];
      };
    };
  };
}
