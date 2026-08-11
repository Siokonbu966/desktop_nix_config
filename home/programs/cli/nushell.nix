{ pkgs, ... }:
{
  programs.nushell = {
    enable = true;

    shellAliases = {
      q = ''cd $"(ghq root)/(ghq list | str trim | lines | to text | fzf)"'';
      nixc = "cd ~/nixos-config/";
      initpart = "nix flake init -t github:hercules-ci/flake-parts";
    };

    environmentVariables = {
      EDITOR = "nvim";
    };

    settings = {
      history = {
        max_size = 10000;
        sync_on_enter = true;
      };
      completions = {
        case_sensitive = false;
      };
      show_banner = false;
    };

    configFile.source = ../../../configs/nu/default.nu;
  };

  home.file = {
    ".config/nushell/git-completion.nu".source = ../../../configs/nu/git-completion.nu;
    ".config/nushell/ssh-agent.nu".source = ../../../configs/nu/ssh-agent.nu;
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
      directory = {
        truncation_length = 3;
        truncation_symbol = "…/";
      };
      git_branch = {
        symbol = " ";
      };
      nix_shell = {
        symbol = " ";
      };
    };
  };

  programs.direnv = {
    enableNushellIntegration = true;
  };

  programs.yazi = {
    enableNushellIntegration = true;
  };
}
