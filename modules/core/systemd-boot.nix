{ config, lib, pkgs, ... }: {

  boot.loader = {
    timeout = 1;

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };

    grub.enable = false;
  };
}
