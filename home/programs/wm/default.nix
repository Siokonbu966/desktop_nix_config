{ device ? "desktop", ...}: 
let
  device_wm = if device == "desktop" then [
    ./niri.nix
  ] else if device == "surface" then [
    ./sway.nix
  ] else [];
in
{
  imports = [
    ./waybar.nix
    ./swayidle.nix
    ./swaylock.nix
  ] ++ device_wm;
}
