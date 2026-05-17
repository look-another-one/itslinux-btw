{ config, pkgs, user, ... }: 

{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 3d --keep 3";
    flake = "${user.homeDirectory}/itslinux-btw/nix/flake"; 
  };

  programs.nix-ld.enable = true;

}
