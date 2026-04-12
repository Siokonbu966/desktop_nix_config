{...}:
{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    config = {
      defaultWorkspace = "1";

      gaps = {
        inner = 6;
        outer = 3;
      };
      colors = {
        focused = {
          border = "#00ffff";
          background = "#2ca9e1";
          text = "#000000";
          indicator = "#2e9ef4";
          childBorder = "#2ca9e1";
        };
      
        unfocused = {
          border = "#b0c4de";
          background = "#778899";
          text = "#ffffff";
          indicator = "#b0c4de";
          childBorder = "#285577";
        };
      };
      bars = [
        {
          command = "waybar";
        }
      ];
      modifier = "Mod4";
      terminal = "ghostty";
      input = {
        "*" = {
          # reverse mouse scroll
          natural_scroll = "enabled";
        };
      };
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
      bindsym Print exec sh -c 'FILE=~/Pictures/screen_shots/$(date +%Y.%m.%d-%H:%M:%S).png; grim -g "$(slurp)" "$FILE" && notify-send "Screen shot saved" "$FILE"'
      bindsym Shift+Print exec sh -c 'FILE=~/Pictures/screen_shots/$(date +%Y.%m.%d-%H:%M:%S).png; grim  "$FILE" && notify-send "Screen shot saved" "$FILE"'

      exec_always fcitx5

      # bg
      output * bg /home/crocus/Pictures/photo/favorite/mahuyu_26_birthday.PNG fill
      
      default_border pixel 4
      default_floating_border pixel 4
    '';
  };
}
