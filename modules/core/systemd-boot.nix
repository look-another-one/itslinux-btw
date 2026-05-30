{ config, lib, pkgs, ... }: {

  boot.loader = {
    timeout = 0;

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    systemd-boot = {
      enable = true;
      configurationLimit = 10;
      editor = false;
      consoleMode = "max";
    };

    grub.enable = false;
  };
}
