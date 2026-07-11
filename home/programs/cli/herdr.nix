{ pkgs, inputs, ... }:
{
  programs.herdr = {
    enable = true;
    package = inputs.herdr.packages.${pkgs.system}.default;
    settings = {
      onboarding = false;
      terminal = {
        default_shell = "nu";
        new_cwd = "follow";
        shell_mode = "auto";
      };
      theme = {
        auto_switch = true;
        name = "catppuccin";
        dark_name = "catppuccin";
        light_name = "catppuccin-latte";
      };
      ui = {
        sidebar_width = 32;
        sound = {
          enabled = true;
        };
      };
    };
  };
}
