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
<<<<<<< Updated upstream
    ./swayidle.nix
    ./swaylock.nix
  ] ++ device_wm;
=======
    # ./niri.nix
    ./swayidle.nix
    ./swaylock.nix
    ./sway.nix
  ];
>>>>>>> Stashed changes
}
