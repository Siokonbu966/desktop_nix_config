{ pkgs, config, ... }:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Adwaita-dark";
    };
  };

  gtk.gtk4.theme = config.gtk.theme;
}
