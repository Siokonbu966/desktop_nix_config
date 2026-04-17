{...}:
{
  imports = [
    ../../configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-desktop";

  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;
    settings.default_session.command = "Hyprland";
  };
}
