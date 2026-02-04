{ config, pkgs, ... }:

{
  imports = [
    ../nix/hardware-configuration.nix
    ../modules/services.nix
    ../modules/sddm.nix
  ];

  #### BOOT ####
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #### SYSTEM ####
  networking.hostName = "nixos-btw";
  time.timeZone = "Asia/Karachi";
  networking.enableIPv6 = true;
  users.defaultUserShell = pkgs.zsh;

  #### LOCALE ####
  i18n.defaultLocale = "en_US.UTF-8";

  #### USERS ####
  users.users.yousaytoday = {
    isNormalUser = true;
    description = "yousaytoday";
    extraGroups = [ "networkmanager" "wheel" "vboxusers" ];
    packages = with pkgs; [ ];
  };

  #### NIX ####
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  #### PACKAGES ####
  environment.systemPackages = import ../modules/packages.nix { inherit pkgs; };



  #### VERSION ####
  system.stateVersion = "25.11";
}

