{ config, pkgs, lib, ... }:

{
 # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.crocus = {
    isNormalUser = true;
    description = "crocus";
    extraGroups = [
      "wheel"
    ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
  #  wget
  ];

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };

  system.stateVersion = "25.11";
}
