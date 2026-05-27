{ pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history.size = 10000;
    
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    
    initContent = ''
      source ~/.p10k.zsh
      alias q='cd "$(ghq root)/$(ghq list | fzf)"'
      alias nixc='cd ~/nixos-config/'
      alias initpart='nix flake init -t github:hercules-ci/flake-parts'
    '';
  };
}
