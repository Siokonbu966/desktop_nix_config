{ device, pkgs, ...}:
let
  isWsl = device == "wsl";
  waylandFrontend = !isWsl;
in
{
  # Select internationalisation properties.
  i18n.defaultLocale = "ja_JP.UTF-8";
  i18n.supportedLocales = [
    "ja_JP.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
  ];

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };

  i18n.inputMethod = {
    type = "fcitx5";
    enable = !isWsl;
    fcitx5.waylandFrontend = waylandFrontend;
    fcitx5.addons = with pkgs;[
      fcitx5-mozc
      fcitx5-gtk
    ];
  };

  environment.variables = pkgs.lib.mkIf isWsl {
    XMODIFIERS = "@im=fcitx";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
  };

  environment.systemPackages = pkgs.lib.mkIf isWsl (with pkgs; [
    fcitx5
    fcitx5-gtk
    fcitx5-mozc
  ]);
}
