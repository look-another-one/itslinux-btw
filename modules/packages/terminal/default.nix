{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    warp-terminal
    tmux
    yazi
    nushell
    eza
    cava
    tty-clock
  ];
}
