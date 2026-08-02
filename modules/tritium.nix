{ config, lib, pkgs, ... }: {
  options.custom.tritium.enable = lib.mkEnableOption "Yocto/Tritium build environment";

  config = lib.mkIf config.custom.tritium.enable {
    environment.systemPackages = with pkgs; [
      gawk
      wget
      git
      diffstat
      unzip
      gcc
      gnumake
      binutils
      chrpath
      socat
      cpio
      (python3.withPackages (
        ps: with ps; [
          pip
          pexpect
        ]
      ))
      nodejs_24
      docker
      github-copilot-cli
      jdk
    ];
  };
}
