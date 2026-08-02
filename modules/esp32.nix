{ config, lib, pkgs, ... }: {
  options.custom.esp32.enable = lib.mkEnableOption "ESP32 toolchain";

  config = lib.mkIf config.custom.esp32.enable {
    environment.systemPackages = with pkgs; [
      esptool
      openocd
    ];

    # udev rules for common ESP32 USB-to-serial and JTAG chips
    services.udev.extraRules = ''
      # Silicon Labs CP210x (most common ESP32 devboards)
      SUBSYSTEM=="tty", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", MODE="0660", GROUP="dialout"
      # WinChipHead CH340
      SUBSYSTEM=="tty", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="7523", MODE="0660", GROUP="dialout"
      # WinChipHead CH9102
      SUBSYSTEM=="tty", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="55d4", MODE="0660", GROUP="dialout"
      # Espressif USB JTAG/serial (ESP32-S3, ESP32-C3 built-in USB)
      SUBSYSTEM=="tty", ATTRS{idVendor}=="303a", ATTRS{idProduct}=="1001", MODE="0660", GROUP="dialout"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="303a", ATTRS{idProduct}=="1001", MODE="0660", GROUP="dialout"
    '';
  };
}
