{...}:
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      bars = [ ];
      modifier = "Mod4";
    };
    extraConfig = ''
      set $mod Mod4
      bindsym $mod+space exec fuzzel
      bindsym $mod+Return exec ghostty
      bindsym $mod+Shift+q kill

      # Volume
      bindsym XF86AudioRaiseVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      bindsym XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindsym XF86AudioMute exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

      # Media control
      bindsym XF86AudioPlay exec playerctl play-pause
      bindsym XF86AudioPause exec playerctl pause
      bindsym XF86AudioNext exec playerctl next
      bindsym XF86AudioPrev exec playerctl previous

      exec_always waybar
      exec_always fcitx5
    '';
  };
}
