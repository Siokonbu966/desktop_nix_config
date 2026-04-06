{ config, pkgs, ... }:

let
  modmap = import ./modmap.nix;
  keymap = import ./keymap.nix;
in
{
  services.xremap = {
    enable = true;
    config = {
      inherit modmap keymap;
    };
  };
}
