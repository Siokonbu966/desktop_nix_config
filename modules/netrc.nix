let
  githubToken = builtins.getEnv "GITHUB_TOKEN";
in {
  environment.etc."nix/netrc".text = ''
    machine api.github.com
    password ${githubToken}
  '';
  nix.settings.netrc-file = "/etc/nix/netrc";
}
