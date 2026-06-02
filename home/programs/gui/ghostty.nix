{ device ? "desktop", ...}:
let
  deviceConfig = if device == "desktop" then ''
    window-decoration = none
    # background-image = /home/crocus/Pictures/Wallpapers/mahuyu_26_birthday.jpg
    # background-image-fit = cover
    # background-image-opacity = 0.1
    background-opacity = 0.7
  '' else if device == "mac" then ''
    macos-titlebar-style = hidden
    background-image = /Users/crocus/Pictures/Wallpapers/cho-kaguya_concept01c.png
    background-image-fit = cover
    background-image-opacity = 0.1
    # background-opacity = 0.7
  '' else '''';
in
{
  xdg.configFile."ghostty/config".text = ''
    font-family = Mononoki Nerd Font
    font-family = Kosugi Maru
    font-size = 17

    working-directory = home
    window-inherit-working-directory = false

    ${deviceConfig}
  '';
}
