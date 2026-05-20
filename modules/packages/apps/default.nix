{ config, pkgs, freesmlauncher,  ... }:

{
  environment.systemPackages = with pkgs; [
    scrcpy
    wget
    git
    unzip
    dysk
    bat
    mpv
    imv
    quickshell
    qt6.qtwayland
    papirus-icon-theme
    ];
}
