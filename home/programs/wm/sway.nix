{...}:
{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    config = {
      bars = [ ];
      modifier = "Mod4";
      terminal = "ghostty";
    };
    extraConfig = ''
      set $mod Mod4
      bindsym mod1+space exec fuzzel

      # Volume
      bindsym XF86AudioRaiseVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      bindsym XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindsym XF86AudioMute exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

      # Media control
      bindsym XF86AudioPlay exec playerctl play-pause
      bindsym XF86AudioPause exec playerctl pause
      bindsym XF86AudioNext exec playerctl next
      bindsym XF86AudioPrev exec playerctl previous
      bindsym Print exec grim ~/Pictures/screen_shots/$(date +%Y.%m.%d-%H:%M:%S).png

      exec_always fcitx5

      # bg
      output * bg /home/crocus/Pictures/photo/favorite/mahuyu_26_birthday.PNG fill
    '';
  };
}
