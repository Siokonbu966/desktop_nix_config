{ ... }:

{
  imports = [
    ./config/base.nix
    ./config/options.nix
    ./config/keymaps.nix
    ./config/lsp.nix
    ./config/diagnostic.nix
    ./config/plugins
  ];
}
