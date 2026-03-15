{ config, pkgs, ... }:

{
  # ── MariaDB Service ──────────────────────────────────────────────────────────
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  # ── GUI & CLI Tools ──────────────────────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    mariadb           # gives you the `mysql` CLI command
    dbeaver-bin
  ];
}
