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
    ../../modules/core/greetd.nix
    ../../modules/core/grub.nix
    ../../modules/core/bluetooth.nix
    ../../modules/core/printing.nix
    ../../modules/core/flatpak.nix
    ../../modules/core/virtualisation.nix
    ../../modules/core/audio.nix
    ../../modules/core/disk.nix
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
    # ---------------- Theme --------------
    ../../modules/program/theme/dms/default.nix
    # ---------------- Shell --------------
    ../../modules/program/shell/zsh/default.nix
    #################################################################
    ###                         Packages                          ### 
    #################################################################
    ../../modules/packages/apps/default.nix
  ] ++ (builtins.map (lang: ../../modules/program/languages/${lang}/default.nix) (builtins.attrNames vars.languages));

  nix.settings.auto-optimise-store = true;

  #### SYSTEM ####
  networking.hostName = vars.hostName;
  time.timeZone = vars.timeZone;
  networking.enableIPv6 = true;

  #### LIX ####
  nix.package = pkgs.lixPackageSets.stable.lix;

  # Latest Kernal 
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
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

  system.stateVersion = vars.stateVersion;
}
