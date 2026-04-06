{...}:
{
  wayland.windowManager.sway = {
    config = {
      bars = [ ];
      startup = [
        { command = "waybar"; }
      ];
      keybindings = {
        "Mod4+d" = "exec fuzzel";
      };
    };

    extraConfig = ''
      set $term ghostty
      bindsym $mod+Return exec $term
    '';
  };
}
