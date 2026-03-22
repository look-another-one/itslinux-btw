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
  };
}
