{...}:
{
  wayland.windowManager.sway = {
    config = {
      bars = [ ];
      startup = [
        { command = "waybar"; }
      ];
    };

    extraConfig = ''
      set $term ghostty
      bindsym $mod+Return exec $term
    '';
  };
}
