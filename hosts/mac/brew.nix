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
      "google-chrome"
    ];
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };
  };
}
