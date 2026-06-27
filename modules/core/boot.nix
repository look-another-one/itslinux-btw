{ ... }:

{
  #### BOOT ####

  boot.initrd.systemd.enable = true;
  boot.consoleLogLevel = 0;
  boot.kernelParams = [
    "quiet"
    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
    # Skip ACPI table parsing delay
    "acpi_osi=Linux"
  ];
}
