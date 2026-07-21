{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # c / c++
    clang-tools
    cmake-language-server

    # python
    pyright

    # javascript / typescript
    typescript-language-server
    vscode-langservers-extracted  # html, css, json, eslint
    emmet-language-server
    tailwindcss-language-server
    svelte-language-server

    # go
    gopls
    delve

    # haskell
    haskell-language-server

    # latex
    texlab

    # nix
    nil

    # lua
    lua-language-server
    stylua

    # bash
    bash-language-server

    # treesitter
    tree-sitter
  ];
}
