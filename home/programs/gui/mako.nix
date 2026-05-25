{ ... }:
{
  services.mako = {
    enable = true;

    settings = {
      backgroundColor = "#1e1e2e";
      textColor = "#cdd6f4";
      borderColor = "#89b4fa";

      borderSize = 2;
      defaultTimeout = 3000;

      font = "Noto Sans 10";
    };
    extraConfig = ''
      [urgency=high]
      border-color=#f38ba8
    '';
  };
}
