{ device ? "saffron", ...}: 
let
  device_wm = if device == "saffron" then [
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
