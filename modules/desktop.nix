{ pkgs, ... }: {
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
    theme = "catppuccin-mocha-mauve";
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

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    catppuccin-sddm

    # terminal
    kitty

    # hyprland ecosystem
    hyprlock
    hypridle
    hyprshot
    wlogout
    awww
    waybar
    wofi

    # desktop utils
    nautilus
    udiskie
    brightnessctl
    pamixer
    pavucontrol
    btop
    libnotify
    wl-clipboard
    hyprpolkitagent
    playerctl
    networkmanagerapplet
  ];
}
