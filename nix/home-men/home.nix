{ config, pkgs, vars, user, ... }:

{
  home.username = user.username;
  home.homeDirectory = user.homeDirectory;
  home.stateVersion = "25.05";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  imports = [
    ./default_apps.nix
    ../../modules/program/browser/${vars.browser}/default.nix
    ../../modules/program/cli/btop/default.nix
    ../../modules/program/cli/cava/default.nix
    ../../modules/program/cli/fastfetch/default.nix
    ../../modules/program/cli/rofi/default.nix
    ../../modules/program/cli/zellij/default.nix
    ../../modules/program/media/vesktop/default.nix
    ../../modules/program/editor/neovim/default.nix
    ../../modules/program/editor/vscodium/default.nix
    ../../modules/program/shell/nushell/default.nix
    ../../modules/program/editor/antigravity/default.nix
    ../../modules/program/cli/kitty/default.nix
    ../../modules/program/dev/android-tools/default.nix
    ../../modules/program/media/localsend/default.nix
    ../../modules/program/media/keepassxc/default.nix
    ../../modules/program/media/nemo/default.nix
  ];

  xdg.configFile = {
    "niri".source    = ../../config/configfiles/niri;
    "kitty".source   = ../../config/configfiles/kitty;
    "rofi".source    = ../../config/configfiles/rofi;
  };

  home.file.".zshrc".text = ''
    # Zshrc Loader
    export FLAKE_DIR="${user.flakeDirectory}"
    ZSHRC_DIR="${user.flakeDirectory}/config/configfiles/zshrc"

    [ -d "$ZSHRC_DIR" ] || return

    for f in "$ZSHRC_DIR"/*; do
        [ -f "$f" ] || continue
        source "$f"
    done
  '';

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
