{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # c / c++
    clang-tools

    # python
    pyright

    # javascript / typescript
    typescript-language-server
    vscode-langservers-extracted  # html, css, json, eslint

    # nix
    nil

    # lua
    lua-language-server

    # bash
    bash-language-server
  ];
}
