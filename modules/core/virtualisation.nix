{ config, pkgs, ... }:

{
  # Enable KVM virtualization
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;       # TPM emulation (needed for Win11)
    };
  };

  # virt-manager frontend
  programs.virt-manager.enable = true;

  # Add your user to libvirtd group
  users.users.humenbeing.extraGroups = [ "libvirtd" "kvm" ];

  # Optional: enable spice-vdagentd for clipboard sharing with guests
  services.spice-vdagentd.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice-gtk
    virtio-win  
  ];
}