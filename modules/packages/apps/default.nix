{ config, pkgs, freesmlauncher,  ... }:

{
  environment.systemPackages = with pkgs; [
    keepassxc
    appimage-run
    scrcpy
    localsend
    glib
    hunspell
    hunspellDicts.en_US
    mesa
    jetbrains-mono
    nemo
    wget
    git
    unzip
    dysk
    bat
    android-tools
    mpv
    imv
    gimp
    v4l-utils
    kitty
    eza
    tty-clock
    quickshell
    qt6.qtwayland
    antigravity
    papirus-icon-theme
    ];
}
