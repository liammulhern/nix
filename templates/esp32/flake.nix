{
  description = "ESP32 development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        espidf
        esptool
        cmake
        ninja
        python3
      ];

      shellHook = ''
        export IDF_PATH=${pkgs.espidf}
        export IDF_TOOLS_PATH="$HOME/.espressif"
        source ${pkgs.espidf}/export.sh
      '';
    };
  };
}
