[
  {
    name = "default";
    remap = {
      Shift_L = "z";
      a = "e";
      w = "l";
      s = "i";
      x = "c";
      e = "u";
      d = "a";
      c = "v";
      r = "f";
      f = "o";
      v = "Comma";
      g = "Minus";
      j = "k";
      m = "g";
      i = "w";
      k = "t";
      Comma = "d";
      o = "r";
      p = "y";
      l = "n";
      Semicolon = "s";
      Apostrophe = "h";
      CapsLock = "q";
      Dot = "m";
     
      b = "Ctrl_L";
      n = "Alt_R";
      h = "Shift_L";
      t = "Kp0"; # +

      # mj xc
      Slash = {
        held = "RightMeta";
        alone = "j";
        free_hold = true;
      };
      z = {
        held = "RightMeta";
        alone = "x";
        free_hold = true;
      };

    };
  }

  {
    name = "jis";
    device = {
      only = "Keychron Keychron K2";
    };
    remap = {
      RO = "b";
      Backslash = "p";
      # 特殊キー
      Muhenkan = "Enter";

      Space = {
        held = "Insert";
        alone = "Backspace";
        free_hold = true;
      };
      Henkan = {
        held = "ScrollLock";
        alone = "Space";
        free_hold = true;
      };
    };
  }

  {
    name = "global_us";
    device = {
      only = "Keychron Keychron Receiver Keyboard";
    };
    remap = {
      Shift_R = "b";
      Enter = "p";
      # 特殊キー
      Alt_L = "Enter";

      Space = {
        held = "Insert";
        alone = "Backspace";
        free_hold = true;
      };
      Alt_R = {
        held = "ScrollLock";
        alone = "Space";
        free_hold = true;
      };
    };
  }
]
