{ config, pkgs, ... }:
{
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    xdg-desktop-portal-gtk
  ];
}