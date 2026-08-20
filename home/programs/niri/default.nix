{ pkgs, ... }:
{
  home.packages = [ pkgs.niri ];

  # wayland.windowManager.niri config would go here if needed
}
