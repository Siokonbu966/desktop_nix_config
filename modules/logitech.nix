{ pkgs, ... }:
{
  hardware.logitech.wireless.enable = true;

  environment.systemPackages = [
    # pkgs.solaar
  ];

  services.logiops = {
    enable = true;
    config = {
      devices = [
        {
          name = "G304 Lightspeed Wireless Gaming Mouse";
          dpi = 600;
          hiresscroll = {
            hires = true;
            invert = false;
            target = true;
          };
        }
      ];
    };
  };
}
