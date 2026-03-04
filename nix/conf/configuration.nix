{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/services.nix
    ../../modules/sddm.nix
    ../../modules/grub.nix
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
  #### PACKAGES ####
  environment.systemPackages = import ../../modules/packages.nix { inherit pkgs; };

  #### VERSION ####
  system.stateVersion = "25.11";
}

