{ lib, pkgs, ... }:

{
  plugins.lsp = {
    enable = true;

    servers = {
      nixd = {
        enable = true;
        settings =
          let
            flake = ''(builtins.getFlake "github:elythh/flake)""'';
            flakeNixvim = ''(builtins.getFlake "github:elythh/nixvim)""'';
          in
          {
            nixpkgs = {
              expr = "import ${flake}.inputs.nixpkgs { }";
            };
            formatting = {
              command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
            };
            options = {
              nixos.expr = ''${flake}.nixosConfigurations.grovetender.options'';
              nixvim.expr = ''${flakeNixvim}.packages.${pkgs.system}.default.options'';
            };
          };
      };
      eslint.enable = true;
      ts_ls.enable = true;
      cssls.enable = true;
      tailwindcss.enable = true;
      html.enable = true;
      pyright.enable = true;
      bashls.enable = true;
      clangd.enable = true;
      yamlls.enable = true;
      jsonls.enable = true;
    };
  };

  # Ensure language server executables are available.
  # (Some servers are pulled in automatically by nixvim, but this makes it explicit.)
  extraPackages = with pkgs; [
    typescript-language-server
    vscode-langservers-extracted
  ];
}
