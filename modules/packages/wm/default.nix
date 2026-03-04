{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rofi
    niri
    swaylock-effects
    swww
    swaynotificationcenter
    waybar
    quickshell
    qt6.qtwayland
  ];
}
