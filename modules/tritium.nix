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
    nodejs_24 # includes npm
    docker
  ];
}
