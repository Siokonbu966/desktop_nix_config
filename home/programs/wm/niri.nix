{...}:
{
  programs.niri = {
    enable = true;

    settings = {
      spawn-at-startup = [ "myNoctalia" ];

      layout.gaps = 5;

      binds = {
        "Mod+Return".spawn-sh = "ghostty";
        "Mod+Q".close-window = null;
      };
    };
  };
}
