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
    # Fcitx5をWayland環境に完全に対応させる
    ECMA_IM_MODULE = "fcitx"; 
  };

  # XWaylandアプリでIME候補ウィンドウを正しく表示するための設定
  xdg.configFile."fcitx5/conf/xim.conf".text = ''
    UseOnTheSpot=True
  '';

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
