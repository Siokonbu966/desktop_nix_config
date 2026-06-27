{ pkgs, ... }:
{
  plugins.obsidian = {
    enable = true;
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

  extraPlugins = with pkgs.vimPlugins; [
    plenary-nvim
  ];
}
