{ config, pkgs, vars, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = vars.cursor.name;
    package = pkgs.${vars.cursor.package};
    size = vars.cursor.size;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  
  gtk = {
    enable = true;
    gtk4.theme = config.gtk.theme; 
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };
}
