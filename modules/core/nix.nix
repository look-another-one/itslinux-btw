{ config, pkgs, user, ... }: 

{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 3d --keep 3";
    flake = "${user.flakeDirectory}/nix/flake/"; 
  };

  programs.nix-ld.enable = true;

}
