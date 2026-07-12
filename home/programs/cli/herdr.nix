{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.herdr.packages.${pkgs.system}.default
  ];

  xdg.configFile."herdr/config.toml".source = (pkgs.formats.toml { }).generate "config.toml" {
    onboarding = false;
    terminal = {
      default_shell = "nu";
      new_cwd = "follow";
      shell_mode = "auto";
    };
    theme = {
      name = "kanagawa";
      dark_name = "kanagawa";
    };
    ui = {
      sidebar_width = 32;
      sound = {
        enabled = true;
      };
    };
    keys = {
      prefix = "ctrl+g";
    };
  };
}
