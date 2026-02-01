{ config, pkgs, inputs, ... }:

{
  #### NETWORKING ####
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  #### BLUETOOTH ####
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman.enable = true;


    #### PROGRAMS ####
  programs.niri.enable = true;
  programs.zsh.enable = true;
  programs.firefox.enable = true;


  #### INPUT ####
  services.keyd.enable = true;

  #### FLATPAK ####
  services.flatpak.enable = true;

  #### AUDIO ####
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  #### VIRTUALISATION ####
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;   # libvirt daemon

  #### SSH ####
  services.openssh.enable = true;
  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;
  #### PRINTING ####
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      hplip
      gutenprint
      brlaser
    ];
  };


}

