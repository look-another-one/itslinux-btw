{ config, pkgs, vars, ... }:

{
  home.username = "yousaytoday";
  home.homeDirectory = "/home/yousaytoday";
  home.stateVersion = "25.05";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  imports = [
    ../../modules/program/browser/${vars.browser}/default.nix
    ../../modules/program/cli/btop/default.nix
    ../../modules/program/cli/cava/default.nix
    ../../modules/program/cli/fastfetch/default.nix
    ../../modules/program/cli/rofi/default.nix
    ../../modules/program/cli/swaylock/default.nix
    ../../modules/program/cli/swaync/default.nix
    ../../modules/program/cli/yazi/default.nix
    ../../modules/program/cli/zellij/default.nix
    ../../modules/program/media/vesktop/default.nix
    ../../modules/program/editor/neovim/default.nix
    ../../modules/program/shell/nushell/default.nix
  ];

  xdg.configFile = {
    "niri".source   = ../../config/configfiles/niri;
    "starship".source = ../../config/configfiles/starship;
    "kitty".source  = ../../config/configfiles/kitty;
  };

  home.file.".zshrc".source = ../../config/dotfiles/.zshrc;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
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
