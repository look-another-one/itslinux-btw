{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    unzip
    bat
  ];
}

