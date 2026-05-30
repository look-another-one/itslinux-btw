{ pkgs, lib, ... }:

{
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  programs.dconf.enable = true;
  services.devmon.enable = true;
  environment.systemPackages = with pkgs; [
    gvfs
    udisks2
  ];

  swapDevices = lib.mkForce [];
}
