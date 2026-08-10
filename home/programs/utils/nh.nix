{ device ? "saffron", ...}:
let
  device_flake = if device == "mac" then ''
    /Users/crocus/nixos-config
  '' else if device == "zephyr" then ''
    /Users/zephyr/nixos-config
  '' else ''
    /home/crocus/nixos-config
  '';
in
{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 4d --keep 3";
    };
    flake = "${device_flake}";
  };
}
