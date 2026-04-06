{ config, pkgs, ... }:

let
  modmap = import ./modmap.nix;
  keymap = import ./keymap.nix;
  virtual_modifires = import ./virtual_modifires.nix;
in
{
  services.xremap = {
    enable = true;
    config = {
      inherit modmap keymap virtual_modifires;
    };
  };
}
