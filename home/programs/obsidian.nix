{ pkgs, device ? "saffron", lib, ... }:
let
  isWsl = device == "wsl";
in
{
  programs.nixvim = {
    plugins.obsidian = {
      enable = lib.mkDefault (!isWsl);
      settings = {
        workspaces = [
          {
            name = "main";
            path = "~/Documents/main";
          }
        ];
        legacy_commands = false;
        picker.name = "telescope.nvim";
        completion.nvim_cmp = true;
      };
    };

    extraPlugins = lib.mkDefault (with pkgs.vimPlugins; [
      plenary-nvim
    ]);
  };
}
