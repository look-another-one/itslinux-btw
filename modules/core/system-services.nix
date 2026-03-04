{ config, pkgs, ... }:

{
  #### SYSTEM SERVICES ####
  services.gvfs.enable = true;
  programs.nix-ld.enable = true;
}
