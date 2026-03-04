{ config, pkgs, ... }:

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
    #################################################################
    ###                         Programs                          ### 
    #################################################################
    ../../modules/program/niri/default.nix
    ../../modules/program/keyd/default.nix
    ../../modules/program/obs-studio/default.nix
    #################################################################
    ###                         Packages                          ### 
    #################################################################
    ../../modules/packages/cli/default.nix
    ../../modules/packages/terminal/default.nix
    ../../modules/packages/wm/default.nix
    ../../modules/packages/browsers/default.nix
    ../../modules/packages/editors/default.nix
    ../../modules/packages/media/default.nix
    ../../modules/packages/dev/default.nix
    ../../modules/packages/apps/default.nix
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # 3. Automatically optimize the Nix store (saves even more space)
  nix.settings.auto-optimise-store = true;

  #### SYSTEM ####
  networking.hostName = "nixos-btw";
  time.timeZone = "Asia/Karachi";
  networking.enableIPv6 = true;

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

