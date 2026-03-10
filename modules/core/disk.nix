{ pkgs, ... }:

{
  # Core daemon for detecting and mounting removable drives
  services.udisks2.enable = true;

  # Required for Nemo to show volumes in the sidebar
  services.gvfs.enable = true;

  # Required for Nemo settings and volume management outside GNOME/Cinnamon
  programs.dconf.enable = true;

  # Auto-mount drives on plug-in
  services.devmon.enable = true;

  # Required packages
  environment.systemPackages = with pkgs; [
    gvfs
    udisks2
  ];
}
