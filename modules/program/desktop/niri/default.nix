{ config, pkgs, user, ... }:
{
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
  home-manager.users.${user.username} = {
    xdg.configFile."niri".source = ../../../../config/configfiles/niri;
  };
}
