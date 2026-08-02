{ pkgs, ... }: {
  imports = [
    ../../modules
  ];

  custom.shell.enable = true;
  custom.dev.enable = true;
  custom.docker.enable = true;
  custom.lsp.enable = true;
  custom.tritium.enable = true;

  wsl.enable = true;
  wsl.defaultUser = "liam";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
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
    extraGroups = [
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";
}
