{ pkgs, ... }:

{
  home.packages = with pkgs; [ kitty eza ];

  xdg.configFile."kitty".source = ../../../../config/configfiles/kitty;
}
