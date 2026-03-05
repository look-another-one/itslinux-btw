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
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "icon";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };

  home.sessionVariables = {
    GTK_THEME = "Adwaita-dark";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  
}
