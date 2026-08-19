{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    papirus-icon-theme
  ];

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

  home.sessionVariables = {
    XDG_DATA_DIRS = "$XDG_DATA_DIRS:${pkgs.papirus-icon-theme}/share";
    XMODIFIERS = "@im=fcitx";
    QT_IM_MODULE = "fcitx";
    GTK_IM_MODULE = "fcitx";
    ECMA_IM_MODULE = "fcitx"; 
  };

  xdg.desktopEntries.obsidian = {
    name = "Obsidian";
    exec = "obsidian %u";
    icon = "obsidian";
    comment = "Knowledge base reflecting your mind";
    categories = [ "Office" "Utility" ];
    mimeType = [ "x-scheme-handler/obsidian" ];
    settings = {
      StartupWMClass = "electron";
    };
  };

}
