{ config, pkgs, ... }:

{

  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  # Add user to libvirtd group
  users.users.yousaytoday.extraGroups = [ "libvirtd" "kvm" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    pkgs.adwaita-icon-theme
  ];

  # Manage the virtualisation services

}
