{...}:
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      bars = [ ];
    };
    extraConfig = ''
      set $mod Mod4
      bindsym $mod+space exec fuzzel
      bindsym $mod+Return exec ghostty
      exec_always waybar
    '';
  };
}
