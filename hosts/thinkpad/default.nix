{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/cli.nix
    ../../modules/desktop.nix
    ../../modules/lsp.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "thinkpad";
  networking.networkmanager.enable = true;

  services.resolved = {
    enable = true;
    fallbackDns = [ "1.1.1.1" "8.8.8.8" ];
  };

  time.timeZone = "Australia/Brisbane";
  i18n.defaultLocale = "en_IE.UTF-8";

  hardware.graphics.enable = true;
  hardware.enableRedistributableFirmware = true;
  hardware.bluetooth.enable = true;

  services.libinput.enable = true;
  services.openssh.enable = true;
  services.fstrim.enable = true;
  services.blueman.enable = true;

  users.users.liam = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "bluetooth" ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";
}
