# /etc/nixos/grub.nix

{ config, lib, pkgs, ... }:

{
  boot.loader = {

    timeout = 10;

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    
    grub = {
      enable = true;
      device = "nodev";          
      efiSupport = true;
      useOSProber = true;        
      configurationLimit = 10;   
      
      theme = lib.mkForce (pkgs.fetchFromGitHub {
        owner = "shvchk";
        repo = "fallout-grub-theme";
        rev = "master";
        hash = "sha256-dNRLM9tQjWOyi3s4Q2er5Xn2bpG/yQ/D/+F/lfYXrs8=";
      });
    };
    
    systemd-boot.enable = false;
  };
}
