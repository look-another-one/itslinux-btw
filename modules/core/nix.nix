{ config, pkgs, ... }: 

{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 3d --keep 3";
    flake = "/home/humenbeing/itslinux-btw/nix/flake"; 
  };

  programs.nix-ld.enable = true;

}
