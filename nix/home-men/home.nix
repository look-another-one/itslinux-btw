{ config, pkgs, ... }:

{
  home.username = "yousaytoday";
  home.homeDirectory = "/home/yousaytoday";
  home.stateVersion = "25.05";

  
  xdg.configFile = {
    "neovim".source     = ../../config/nvim;
    "rofi".source     = ../../config/rofi;
    "swaylock".source = ../../config/swaylock;
    "swaynotificationcenter".source   = ../../config/swaync;
    "cava".source = ../../config/cava;
    "niri".source = ../../config/niri;
    "starship".source = ../../config/starship;
    "fastfetch".source = ../../config/fastfetch;
   };

}
