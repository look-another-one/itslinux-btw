{ lib, ... }:

{
  #### NETWORKING ####
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  services.avahi.enable = lib.mkForce false;
}
