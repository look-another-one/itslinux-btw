{ config, pkgs, ... }:
{
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback.out
      pkgs.linuxPackages.v4l2loopback
    ];
    kernelModules = [ "v4l2loopback" ];
    extraModprobeConfig = ''
      options v4l2loopback exclusive_caps=1
    '';
    loader.grub.extraEntries = ''
      menuentry "Ubuntu 24.04" {
        insmod part_gpt
        insmod ext2
        search --no-floppy --fs-uuid --set=root a181a691-0389-492a-ba7d-dff2eb75ff43
        linux /boot/vmlinuz-6.17.0-19-generic root=UUID=a181a691-0389-492a-ba7d-dff2eb75ff43 quiet splash
        initrd /boot/initrd.img-6.17.0-19-generic
      }
    '';
  };
}
