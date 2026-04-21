{ pkgs, ... }:
{
  hardware.logitech.wiress.enable = true;

  environment.systemPackages = [
    pkgs.solaar
  ];
}
