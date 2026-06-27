{ lib, ... }:

{
  systemd.services.systemd-networkd-wait-online.enable = false;
  systemd.services.ModemManager.enable = false;
  systemd.services."systemd-backlight@".wantedBy = lib.mkForce [];
}
