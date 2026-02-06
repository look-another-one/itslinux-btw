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
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  virtualisation.virtualbox.host.enable = true;
#  virtualisation.virtualbox.host.enableExtensionPack = true;

#  users.users.yousaytoday.extraGroups = [ "vboxusers" ];


}

