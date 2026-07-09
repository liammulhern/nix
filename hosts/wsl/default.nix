{ pkgs, ... }: {
  imports = [
    ../../modules/cli.nix
    ../../modules/lsp.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "liam";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  time.timeZone = "Australia/Brisbane";
  i18n.defaultLocale = "en_IE.UTF-8";

  users.users.liam = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";
}
