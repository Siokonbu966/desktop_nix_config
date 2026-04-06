{
  virtual_modifiers = [
    "Insert"      # Layer 1 Spaceの代わり
    "ScrollLock"  # Layer 2 Henkanの代わり
  ];

  modmap = [
    {
      name = "default";
      remap = {
        Shift_L = "z";
        a = "e";
        z = "x";
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
        Slash = "j";
        Apostrophe = "h";
        Shift_R = "b";
        Dot = "m";
        Enter = "p";
        CapsLock = "q";

        # 特殊キー
        Alt_L = "Enter";
        b = "Ctrl_L";
        n = "Alt_R";
        h = "Shift_L";
      };
    }

    {
      name = "global";
      remap = {
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
  ];
}
