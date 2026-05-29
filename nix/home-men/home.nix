{ config, pkgs, vars, user, ... }:

{
  home.username = user.username;
  home.homeDirectory = user.homeDirectory;
  home.stateVersion = vars.homeStateVersion;

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
    ../../modules/core/theme.nix
  ];
}
