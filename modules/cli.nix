{ pkgs, ... }: {
  documentation.man.enable = true;
  documentation.man.generateCaches = true;

  virtualisation.docker.enable = true;

  programs.nix-ld.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      tokyo-night-tmux
      yank
    ];
  };

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    # build tools
    gcc
    gnumake
    cmake
    pkg-config

    # man pages
    man-pages
    man-pages-posix

    # cli utils
    git
    bash
    zip
    unzip
    ripgrep
    vim
    chezmoi
    claude-code
    yazi
    wget
    curl
    netcat-gnu
    htop
    fastfetch
    zoxide
    fzf
    nodejs_24
    python3
    uv
    docker
    minicom
  ];
}
