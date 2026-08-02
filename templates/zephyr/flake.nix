{
  description = "Zephyr RTOS development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    pythonEnv = pkgs.python3.withPackages (ps: with ps; [
      west
      pyelftools
      pykwalify
      colorama
      pillow
      intelhex
      setuptools
    ]);
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        pythonEnv
        zephyr-sdk     # cross-compilers for all Zephyr-supported architectures
        cmake
        ninja
        dtc            # device tree compiler
        openocd
        gperf
        dfu-util
        git
      ];

      shellHook = ''
        export ZEPHYR_SDK_INSTALL_DIR=${pkgs.zephyr-sdk}

        # Set ZEPHYR_BASE if west workspace is initialised in this directory
        if [ -f zephyr/CMakeLists.txt ]; then
          export ZEPHYR_BASE="$PWD/zephyr"
        fi
      '';
    };
  };
}
