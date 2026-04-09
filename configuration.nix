# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules
      ./nvidia
    ];

  networking.hostName = "nixos";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
  networking.nameservers = [ "192.168.0.1" "8.8.8.8" ];
  networking.defaultGateway = "192.168.0.1";

  # Enable networking
  networking.networkmanager.enable = true;

  # bluetooth setting
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Configure keymap in X11
  # services.xserver.xkb = {
  #   layout = "jp";
  #   variant = "";
  # };

 
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.crocus = {
    isNormalUser = true;
    description = "crocus";
    extraGroups = [
      "networkmanager"
      "wheel"
      "inputs"
    ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  services.udisks2.enable = true;

  environment.sessionVariables = with pkgs; {
    GTK_IM_MODULES = "fcitx";
    QT_IM_MODULES = "fcitx";
    XMODIFERS = "@im=fcitx";
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };

  system.stateVersion = "25.11";
}
