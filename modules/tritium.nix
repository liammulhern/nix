{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gawk
    wget
    git
    diffstat
    unzip
    gcc # gcc-multilib: use pkgsi686Linux.gcc for 32-bit multilib support
    gnumake
    binutils
    chrpath
    socat
    cpio
    (python3.withPackages (ps: with ps; [
      pip
      pexpect
    ]))
    SDL # libsdl1.2-dev
    xterm
    nodejs_24 # includes npm
    docker
  ];
}
