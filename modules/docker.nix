{ config, lib, pkgs, ... }: {
  options.custom.docker.enable = lib.mkEnableOption "Docker";

  config = lib.mkIf config.custom.docker.enable {
    virtualisation.docker.enable = true;
    environment.systemPackages = [ pkgs.docker ];
  };
}
