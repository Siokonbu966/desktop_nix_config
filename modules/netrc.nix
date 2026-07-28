{
  let
    githubToken = builtins.readFile "/home/crocus/.config/nix/github-token";
    netrcContent = ''
      machine api.github.com
      password ${githubToken}
    '';
  in {
    environment.etc."nix/netrc".text = netrcContent;
    nix.settings.netrc-file = "/etc/nix/netrc";
  }
}
