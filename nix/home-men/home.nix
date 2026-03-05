{ config, pkgs, ... }:

{
  home.username = "yousaytoday";
  home.homeDirectory = "/home/yousaytoday";
  home.stateVersion = "25.05";

  
  xdg.configFile = {
    "neovim".source     = ../../config/configfiles/nvim;
    "rofi".source     = ../../config/configfiles/rofi;
    "swaylock".source = ../../config/configfiles/swaylock;
    "swaynotificationcenter".source   = ../../config/configfiles/swaync;
    "cava".source = ../../config/configfiles/cava;
    "niri".source = ../../config/configfiles/niri;
    "starship".source = ../../config/configfiles/starship;
    "fastfetch".source = ../../config/configfiles/fastfetch;
    "kitty".source = ../../config/configfiles/kitty;
   };

  home.file.".zshrc".source = ../../config/dotfiles/.zshrc;
  home.file.".icons".source = ../../config/dotfiles/.icons;
 gtk = {
   enable = true;
   iconTheme = {
      name = "main";
   };
  };
}
