{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    my-dotfiles = {
      url = "github:Siokonbu966/dotfiles";
      flake = false;
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
    };
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    xremap-flake.url = "github:xremap/nix-flake";
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    herdr = {
      url = "github:ogulcancelik/herdr/v0.7.3";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    my-dotfiles,
    nixvim,
    nix-darwin,
    nix-ld,
    nixos-wsl,
    nix-homebrew,
    homebrew-core,
    homebrew-cask,
    homebrew-bundle,
    ...
  }@inputs:
  {
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit self inputs; };
      modules = [ 
        ./hosts/mac
        home-manager.darwinModules.home-manager

        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            user = "crocus";
            autoMigrate = true;
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "homebrew/homebrew-bundle" = homebrew-bundle;
            };
            mutableTaps = false;
          };
        }
        ({ config, ... }: {
          homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
        })
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            extraSpecialArgs = {
              inherit
                inputs
                my-dotfiles
              ;
              nixvim-module = nixvim.homeModules.nixvim;
              device = "mac";
            };
            users.crocus = import ./home/mac.nix;
          };
          nixpkgs.config.allowUnfree = true;
        }
      ];
    };

    nixosConfigurations = {
      wsl = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "26.05";
            wsl.enable = true;
            wsl.defaultUser = "crocus";
          }
          nix-ld.nixosModules.nix-ld
          { programs.nix-ld.dev.enable = true; }
          ./hosts/wsl
          ./modules/font.nix

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit 
                  my-dotfiles
                  inputs
                ;
                device = "wsl";
                nixvim-module = nixvim.homeModules.nixvim;
              };
              users.crocus = {
                imports = [
                  ./home/wsl.nix
                ];
              };
            };
          }
        ];
      };

      surface = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
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
                inherit my-dotfiles inputs;
                device = "surface";
                nixvim-module = nixvim.homeModules.nixvim;
              };
              users.crocus = {
                imports = [
                  ./home/surface.nix
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
                device = "desktop";
                nixvim-module = nixvim.homeModules.nixvim;
              };
              users.crocus = {
                imports = [
                  inputs.noctalia.homeModules.default
                  ./home
                ];
              };
            };
          }
        ];
      };

      saffron = inputs.nixpkgs.lib.nixosSystem {
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
                device = "saffron";
                nixvim-module = nixvim.homeModules.nixvim;
              };
              users.crocus = {
                imports = [
                  inputs.noctalia.homeModules.default
                  ./home/saffron.nix
                ];
              };
            };
          }
        ];
      };
    };
  };
}
