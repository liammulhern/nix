{
  description = "Liam's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixos-hardware, nixos-wsl, ... }: {
    templates.esp32 = {
      path = ./templates/esp32;
      description = "ESP-IDF development environment for ESP32";
    };

    templates.stm32 = {
      path = ./templates/stm32;
      description = "STM32 development environment";
    };

    templates.zephyr = {
      path = ./templates/zephyr;
      description = "Zephyr RTOS development environment";
    };

    nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/thinkpad/default.nix
      ];
    };

    nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-wsl.nixosModules.default
        ./hosts/wsl/default.nix
      ];
    };
  };
}
