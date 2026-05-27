{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    my-dotfiles = {
      url = "github:Siokonbu966/dotfiles";
      flake = false;
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    xremap-flake.url = "github:xremap/nix-flake";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    my-dotfiles,
    nixvim,
    nix-ld,
    nixos-wsl,
    ...
  }@inputs: {
    nixosConfigurations = {
      wsl = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "25.05";
            wsl.enable = true;
          }
          nix-ld.nixosModules.nix-ld
          { programs.nix-ld.dev.enable = true; }
          ./hosts/wsl

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit my-dotfiles
                inputs;
                nixvim-module = nixvim.homeModules.nixvim;
              };
              users.crocus = {
                imports = [
                  ./home/wsl
                ];
              };
            };
          }
        ];
      };

      surface = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/surface
          inputs.xremap-flake.nixosModules.default
          ./modules/xremap
          nix-ld.nixosModules.nix-ld
          { programs.nix-ld.dev.enable = true; }

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit my-dotfiles;
                nixvim-module = nixvim.homeModules.nixvim;
              };
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
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/desktop
          ./nvidia
          inputs.xremap-flake.nixosModules.default
          ./modules/xremap
          ./modules/wm
          nix-ld.nixosModules.nix-ld
          { programs.nix-ld.dev.enable = true; }

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit
                  my-dotfiles
                  inputs
                  ;
                nixvim-module = nixvim.homeModules.nixvim;
              };
              users.crocus = {
                imports = [
                  inputs.noctalia.homeModules.default
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
