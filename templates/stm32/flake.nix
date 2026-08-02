{
  description = "STM32 development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        gcc-arm-embedded  # arm-none-eabi-gcc, objcopy, gdb, etc.
        openocd           # flashing and debugging via ST-Link/J-Link
        stlink            # st-flash, st-info, st-util
        cmake
        ninja
        python3
      ];
    };
  };
}
