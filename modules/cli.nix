{ pkgs, ... }: {
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
    htop
    fastfetch
    zoxide
    fzf
    nodejs_24
  ];
}
