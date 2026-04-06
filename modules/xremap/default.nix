{ config, pkgs, ... }:

let
  modmap = import ./modmap.nix;
  keymap = import ./keymap.nix;
  virtual_modifiers = import ./virtual_modifiers.nix;
in
{
  services.xremap = {
    enable = true;
    config = {
      inherit modmap keymap virtual_modifiers;
    };
  };
}
