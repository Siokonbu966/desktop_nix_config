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
      "tailscale"
      "alt-tab"
      "prismlauncher"
      "appcleaner"
      "vscodium"
    ];
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };
  };
}
