{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mpv
    imv
    gimp
    v4l-utils
    obs-studio
  ];
}
