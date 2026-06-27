{ ... }:
{
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  powerManagement.enable = true; 
  services.thermald.enable = true; 
}
