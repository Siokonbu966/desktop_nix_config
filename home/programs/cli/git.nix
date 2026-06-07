{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Siokonbu966";
        email = "167207736+Siokonbu966@users.noreply.github.com";
        signingkey = "~/.ssh/github.pub";
      };
      init = {
        defaultBranch = "main";
      };
      ghq = {
        root = "~/src";
      };
      gpg = {
        format = "ssh";
      };
      pull = {
        rebase = "true";
      };
      core.editor = "vi";
    };
  };
}

