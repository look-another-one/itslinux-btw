{ config, pkgs, freesmlauncher,  ... }:

{
  environment.systemPackages = with pkgs; [
    keepassxc
    appimage-run
    scrcpy
    localsend
    glib
    libreoffice-fresh
    hunspell
    hunspellDicts.en_US
    mesa
    jetbrains-mono
    nemo
    firefox
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
    warp-terminal
    eza
    tty-clock
    quickshell
    qt6.qtwayland
    antigravity
    papirus-icon-theme
    freesmlauncher.packages.x86_64-linux.default
    gitkraken
  ];
}
