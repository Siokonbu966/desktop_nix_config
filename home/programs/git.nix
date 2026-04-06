{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Siokonbu966";
        email = "167207736+Siokonbu966@users.noreply.github.com";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}

