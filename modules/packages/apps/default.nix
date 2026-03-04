{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vesktop
    keepassxc
    appimage-run
    scrcpy
    localsend
    glib
    libreoffice-fresh
    hunspell
    hunspellDicts.en_US
    nautilus
    distrobox
    mesa
    jetbrains-mono
  ];
}
