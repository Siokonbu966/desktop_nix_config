{ device ? "surface", ...}:
let
  device_gui = if device == "saffron" then [
    ./noctalia.nix
  ] else [];
in
{
  imports = [
    ./fuzzel.nix
    ./obs.nix
    ./ghostty.nix
  ] ++ device_gui;
}
