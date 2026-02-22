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


  #### SSH ####
  services.openssh.enable = true;
  #### PRINTING ####
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      hplip
      gutenprint
      brlaser
    ];
  };

  virtualisation.virtualbox.host.enable = true;
  virtualisation.docker.enable = true;

  programs.nix-ld.enable = true;
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback.out
      pkgs.linuxPackages.v4l2loopback
    ];
    kernelModules = [ "v4l2loopback" ];
    extraModprobeConfig = ''
      options v4l2loopback exclusive_caps=1
    '';
  };

}

