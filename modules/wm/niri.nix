{ self, inputs, ... }:
{
  flake.nixosModules.niri = { pkgs, ... }: {
    programs.niri = {
      enable = true;
      packages = self.packages.${pkgs.system}.niri;
    };
  };

  perSystem = { pkgs, inputs, ... }: {
    packages.niri = inputs.niri.packages.${pkgs.system}.default;
  };
}
