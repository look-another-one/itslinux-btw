{ config, pkgs, lib, vars, user, ... }:

{
  imports = [
    ./hardware-configuration.nix
    #################################################################
    ###                         Core Services                     ### 
    #################################################################
    ../../modules/core/networking.nix
    ../../modules/core/ssh.nix
    ../../modules/core/nix.nix
    ../../modules/core/sddm.nix
    ../../modules/core/grub.nix
    ../../modules/core/bluetooth.nix
    ../../modules/core/printing.nix
    ../../modules/core/flatpak.nix
    ../../modules/core/virtualisation.nix
    ../../modules/core/audio.nix
    ../../modules/core/disk.nix
    ../../modules/core/zram.nix
    ../../modules/core/fonts.nix
    #################################################################
    ###                         Programs                          ### 
    #################################################################
    ../../modules/program/cli/keyd/default.nix
    ../../modules/program/media/obs-studio/default.nix
    # ---------------- Editor --------------
    # Moved to home-manager level to support declarative extensions
    # ---------------- Desktop Enviroment --------------
    ../../modules/program/desktop/${vars.desktop}/default.nix
    # ---------------- Database --------------
    ../../modules/program/db/mysql/default.nix
    # ---------------- Dev --------------
    ../../modules/program/dev/tailscale/default.nix
    ../../modules/program/dev/distrobox/default.nix
    # ---------------- Theme --------------
    ../../modules/program/theme/dms/default.nix
    # ---------------- Shell --------------
    ../../modules/program/shell/zsh/default.nix
    #################################################################
    ###                         Packages                          ### 
    #################################################################
    ../../modules/packages/apps/default.nix
  ] ++ (builtins.map (lang: ../../modules/program/languages/${lang}/default.nix) (builtins.attrNames vars.languages));

  # Latest Kernal 
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
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
  users.users.${user.username} = {
    isNormalUser = true;
    description = user.description;
    extraGroups = [ "networkmanager" "wheel" "vboxusers" ];
    packages = with pkgs; [ zsh ];
    shell = pkgs.zsh;
  };

  #### NIX ####
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  #### Fingerprint ####
  services.fprintd = {
    enable = true;
  };


  #boot.kernelModules = [ "v4l2loopback" ];
  #sboot.extraModulePacka ges = [ pkgs.linuxPackages.v4l2loopback ];

  #### VERSION ####
  system.stateVersion = "25.11";
}
