{...}:
{
  imports = [
    ../../configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-desktop";

  networking.interfaces.enp10s0.ipv4.addresses = [{
    address = "192.168.0.19";
    prefixLength = 24;
  }];
}
