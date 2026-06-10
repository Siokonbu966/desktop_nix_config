{
  homebrew = {
    enable = true;
    casks = [
      "firefox"
      "obsidian"
      "ghostty"
      "loop"
      "karabiner-elements"
      "discord"
      "slack"
    ];
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };
  };
}
