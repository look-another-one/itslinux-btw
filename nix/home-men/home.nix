{ config, pkgs, vars, user, ... }:

{
  home.username = user.username;
  home.homeDirectory = user.homeDirectory;
  home.stateVersion = vars.homeStateVersion;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = vars.cursor.name;
    package = pkgs.${vars.cursor.package};
    size = vars.cursor.size;
  };

  imports = [
    ./default_apps.nix
    ../../modules/program/browser/brave/default.nix
    ../../modules/program/cli/btop/default.nix
    ../../modules/program/cli/fastfetch/default.nix
    ../../modules/program/cli/rofi/default.nix
    ../../modules/program/editor/vscodium/default.nix
    ../../modules/program/shell/nushell/default.nix
    ../../modules/program/editor/antigravity/default.nix
    ../../modules/program/cli/kitty/default.nix
    ../../modules/program/dev/android-tools/default.nix
    ../../modules/program/media/localsend/default.nix
    ../../modules/program/media/keepassxc/default.nix
    ../../modules/program/media/nemo/default.nix
    ../../modules/program/cli/starship/default.nix
    ../../modules/program/editor/neovim/default.nix
  ];

  xdg.configFile = {
    "niri".source    = ../../config/configfiles/niri;
    "kitty".source   = ../../config/configfiles/kitty;
    "rofi".source    = ../../config/configfiles/rofi;
  };

  home.file.".face".source = user.avatar;
  home.file.".face.icon".source = user.avatar;

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
