{ config, pkgs, lib, vars, ... }:

{
  imports = [
    ./hardware-configuration.nix
    #################################################################
    ###                         Core Services                     ### 
    #################################################################
    ../../modules/core/networking.nix
    ../../modules/core/ssh.nix
    ../../modules/core/boot.nix
    ../../modules/core/system-services.nix
    ../../modules/core/sddm.nix
    ../../modules/core/grub.nix
    ../../modules/core/bluetooth.nix
    ../../modules/core/printing.nix
    ../../modules/core/flatpak.nix
    ../../modules/core/virtualisation.nix
    ../../modules/core/audio.nix
    ../../modules/core/zsh.nix
    ../../modules/core/disk.nix
    ../../modules/core/zram.nix
    ../../modules/core/theme.nix
    #################################################################
    ###                         Programs                          ### 
    #################################################################
    ../../modules/program/cli/keyd/default.nix
    ../../modules/program/browser/zen/default.nix
    ../../modules/program/media/obs-studio/default.nix
    ../../modules/program/editor/vscodium/default.nix
    ../../modules/program/desktop/niri/default.nix
    ../../modules/program/languages/java/default.nix
    ../../modules/program/languages/nodejs/default.nix
    ../../modules/program/languages/python/default.nix
    #################################################################
    ###                         Packages                          ### 
    #################################################################
    ../../modules/packages/apps/default.nix
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Automatically optimize the Nix store (saves even more space)
  nix.settings.auto-optimise-store = true;

  #### SYSTEM ####
  networking.hostName = "nixos-btw";
  time.timeZone = "Asia/Karachi";
  networking.enableIPv6 = true;

  #### LIX ####
  # Replace Nix with Lix — a faster, friendlier Nix fork
  nix.package = pkgs.lixPackageSets.stable.lix;

  #### USERS ####
  users.users.yousaytoday = {
    isNormalUser = true;
    description = "yousaytoday";
    extraGroups = [ "networkmanager" "wheel" "vboxusers" ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };

  #### NIX ####
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];

  #### VERSION ####
  system.stateVersion = "25.11";
}
