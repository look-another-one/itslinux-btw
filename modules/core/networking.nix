{ config, pkgs, ... }:

{
  #### NETWORKING ####
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
}
