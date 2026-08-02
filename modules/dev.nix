{ config, lib, pkgs, ... }: {
  options.custom.dev.enable = lib.mkEnableOption "development tools and runtimes";

  config = lib.mkIf config.custom.dev.enable {
    environment.systemPackages = with pkgs; [
      # build tools
      gcc
      gnumake
      cmake
      pkg-config

      # runtimes
      nodejs_24
      python3
      uv
    ];
  };
}
