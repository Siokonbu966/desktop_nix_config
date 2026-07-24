{
  inputs,
  ...
}:
let
  inherit (inputs) nixpkgs home-manager nixvim nix-ld xremap-flake noctalia my-dotfiles;
in
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    ../../hosts/desktop
    ../../nvidia
    xremap-flake.nixosModules.default
    ../../modules/xremap
    ../../modules/wm
    nix-ld.nixosModules.nix-ld
    { programs.nix-ld.dev.enable = true; }

    home-manager.nixosModules.home-manager {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {
          inherit
            inputs
            my-dotfiles
          ;
          device = "saffron";
          nixvim-module = nixvim.homeModules.nixvim;
        };
        users.crocus = {
          imports = [
            noctalia.homeModules.default
            ../../home/saffron.nix
          ];
        };
      };
    }
  ];
}
