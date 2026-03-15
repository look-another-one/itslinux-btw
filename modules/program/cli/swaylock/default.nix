{ pkgs, ... }:

{
  home.packages = with pkgs; [ swaylock-effects ];

  xdg.configFile."swaylock".source = ../../../../config/configfiles/swaylock;
}
