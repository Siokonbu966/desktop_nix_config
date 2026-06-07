{...}:
{
  imports = [
    ../../configuration.nix
    ./hardware-configuration.nix
  ];

  programs.dconf.enable = true;

  hardware.graphics.enable = true;

  networking.hostName = "nixos-surface";
}
