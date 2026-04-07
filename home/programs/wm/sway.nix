{...}:
{
  wayland.windowManager.sway = {
    enable = true;
    extraConfig = ''
      set $mod Mod4
      bindsym $mod+space exec fuzzel
      bindsym $mod+Return exec ghostty
    '';
  };
}
