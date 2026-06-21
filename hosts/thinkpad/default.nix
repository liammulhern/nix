{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

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

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.tmux.enable = true;

  programs.zsh.enable = true;

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    # terminal / editor
    kitty

    # hyprland ecosystem
    hyprlock
    hypridle
    hyprshot
    wlogout
    swww
    waybar
    wofi

    # desktop utils
    nautilus
    udiskie
    brightnessctl
    pamixer
    libnotify
    wl-clipboard
    hyprpolkitagent
    playerctl
    networkmanagerapplet

    # cli utils
    git
    vim
    wget
    curl
    htop
    zoxide
    fzf
  ];

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
