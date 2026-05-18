{ config, pkgs, user, ... }:

{
  # Enable KVM virtualization
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };

  programs.virt-manager.enable = true;
  users.users.${user.username}.extraGroups = [ "libvirtd" "kvm" ];
  services.spice-vdagentd.enable = true;
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice-gtk
    virtio-win  
  ];
}