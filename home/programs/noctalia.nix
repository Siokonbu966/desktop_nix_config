{ pkgs, inputs, ...}:
{
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
  };
}
