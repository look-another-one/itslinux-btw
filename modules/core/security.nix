{ ... }:

{
  #### SECURITY ####
  security.audit.enable = false;
  services.journald.extraConfig = ''
    Storage=volatile
    Compress=no
  '';
}
