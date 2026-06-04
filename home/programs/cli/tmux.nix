{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "xterm-256color";
    mouse = true;
    extraConfig = ''
      set -g status-style 'bg=colour062,fg=colour045'
      set -g window-status-current-style 'bg=colour068,fg=colour045'
      set -g status-right ""
    '';
  };
}
