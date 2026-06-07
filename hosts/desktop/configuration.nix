{ pkgs, ... }:
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

  programs.obs-studio.enableVirtualCamera = true;

  # vmware
  virtualisation.vmware.host.enable = true;
  services.xserver.videoDrivers = [ "vmware" ];

  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  boot.kernelModules = [ "v4l2loopback" ];
}
