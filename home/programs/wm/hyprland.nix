{...}:
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # モニター設定
      monitor = ",preferred,auto,1";

      # 起動アプリ
      exec-once = [
        "waybar"
      ];

      # 入力
      input = {
        kb_layout = "jp";
      };

      # 見た目
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };

      decoration = {
        rounding = 10;
      };

      # キーバインド
      "$mod" = "SUPER";

      bind = [
        "$mod, RETURN, exec, alacritty"
        "$mod, Q, killactive"
        "$mod, D, exec, wofi --show drun"
        "$mod, F, fullscreen"
      ];
    };
  };
}
