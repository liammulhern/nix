{ config, lib, ... }: {
  options.custom.stm32.enable = lib.mkEnableOption "STM32 toolchain";

  config = lib.mkIf config.custom.stm32.enable {
    # udev rules for ST-Link programmers/debuggers
    services.udev.extraRules = ''
      # ST-Link v1
      SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3744", MODE="0660", GROUP="dialout"
      # ST-Link v2
      SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3748", MODE="0660", GROUP="dialout"
      # ST-Link v2.1
      SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", MODE="0660", GROUP="dialout"
      # ST-Link v3
      SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374d", MODE="0660", GROUP="dialout"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374e", MODE="0660", GROUP="dialout"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374f", MODE="0660", GROUP="dialout"
    '';
  };
}
