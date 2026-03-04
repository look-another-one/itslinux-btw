{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    uv
    python314
    android-tools
    jdk21
    conda
    nodejs
    lazygit
    lazydocker
  ];
}
