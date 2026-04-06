{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = [ "sway/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "pulseaudio" "battery" ];

        clock = {
          format = "{:%Y-%m-%d %H:%M}";
        };

        cpu = {
          format = "CPU {usage}%";
        };

        memory = {
          format = "MEM {percentage}%";
        };

        battery = {
          format = "{capacity}% {icon}";
        };

        pulseaudio = {
          format = "{volume}% 🔊";
        };
      };
    };

    style = ''
      * {
        font-family: "Noto Sans", "Font Awesome";
        font-size: 14px;
      }

      window#waybar {
        background: rgba(30, 30, 30, 0.8);
        color: white;
      }

      #workspaces button.focused {
        color: #ffffff;
      }
    '';
  };
}
