{
  homebrew = {
    enable = true;
    casks = [
      "firefox"
      "obsidian"
      "ghostty"
      "karabiner-elements"
      "discord"
      "slack"
      "google-chrome"
      "lm-studio"
      "tailscale-app"
      "appcleaner"
      "whatcable"
      "anki"
      "obs"
    ];
    onActivation = {
      autoUpdate = false;
    };
  };
}
