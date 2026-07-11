{ pkgs, ... }:
{
  programs.nushell = {
    enable = true;

    shellAliases = {
      q = ''cd $"(ghq root)/(ghq list | str trim | to text --raw)"'';
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
      color_config = "dark";
      show_banner = false;
    };

    extraConfig = ''
      $env.config.table_mode = 'rounded'
      $env.config.use_ls_colors = true
    '';
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
