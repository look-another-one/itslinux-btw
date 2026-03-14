{ config, pkgs, vars, ... }:

{
  home.username = "yousaytoday";
  home.homeDirectory = "/home/yousaytoday";
  home.stateVersion = "25.05";

 imports = [
  # ...your existing imports...
  ../../modules/program/browser/${vars.browser}/default.nix
 ]; 
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

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };
  
}
