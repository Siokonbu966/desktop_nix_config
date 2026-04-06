{ config, lib, pkgs, ...}:
{
  # fonts
  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    font-awesome
  ];
  fonts.fontDir.enable = true;
  fonts.fontconfig = {
    defaultFonts = {
      serif = [
        "Noto Serif CJK JP"
        "Noto Color Emoji"
      ];
      sansSerif = [
        "Noto Sans CJK JP"
        "Noto Color Emoji"
      ];
      emoji = ["Noto Color Emoji"];
    };
  };


}
