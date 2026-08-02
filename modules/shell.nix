{ config, lib, pkgs, ... }: {
  options.custom.shell.enable = lib.mkEnableOption "shell environment";

  config = lib.mkIf config.custom.shell.enable {
    documentation.man.enable = true;
    documentation.man.generateCaches = true;

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
      # man pages
      man-pages
      man-pages-posix

      # core utils
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
      minicom
    ];
  };
}
