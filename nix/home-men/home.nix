{ config, pkgs, vars, ... }:

{
  home.username = "yousaytoday";
  home.homeDirectory = "/home/yousaytoday";
  home.stateVersion = "25.05";

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
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };
}
