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
    ];
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };
  };
}
