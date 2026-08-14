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
      "lm-studio"
      "tailscale-app"
      "alt-tab"
      "appcleaner"
      "whatcable"
      "anki"
    ];
    onActivation = {
      autoUpdate = false;
    };
  };
}
