{ config, pkgs, ... }: 

{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 3d --keep 3";
    flake = "/home/humenbeing/itslinux-btw/nix/flake"; # sets NH_OS_FLAKE variable for you
  };


  #### SYSTEM SERVICES ####
  services.gvfs.enable = true;
  programs.nix-ld.enable = true;

}
