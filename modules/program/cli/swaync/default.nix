{ pkgs, ... }:

{
  home.packages = with pkgs; [ swaynotificationcenter ];

  xdg.configFile."swaynotificationcenter".source = ../../../../config/configfiles/swaync;
}
