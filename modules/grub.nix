# /etc/nixos/grub.nix

{ config, pkgs, ... }:

{
  boot.loader = {
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
      
      # The Fallout GRUB Theme
      theme = pkgs.fetchFromGitHub {
        owner = "shvchk";
        repo = "fallout-grub-theme";
        rev = "master"; 
        hash = "sha256-dNRLM9tQjWOyi3s4Q2er5Xn2bpG/yQ/D/+F/lfYXrs8="; 
      };
    };
    
    systemd-boot.enable = false;
  };
}
