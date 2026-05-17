{ config, pkgs, ... }:

{
  #### VIRTUALISATION ####
  virtualisation.virtualbox.host.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;
  users.users.humenbeing.extraGroups = [ "podman" ];
}
