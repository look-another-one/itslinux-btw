{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    fastfetch
    unzip
    dysk
    bat
    btop
  ];
}
