{...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = true;
    syntaxHighlighting.enable = true;

    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = p10k.zsh;
        };
      ];
    }
  };
}
