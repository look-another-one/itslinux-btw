{ vars, ... }:

{
  imports = [
    ./hardware-configuration.nix
    #################################################################
    ###                         Core Services                     ### 
    #################################################################
    ../../modules/core/networking.nix
    ../../modules/core/ssh.nix
    ../../modules/core/nix.nix
    ../../modules/core/user.nix
    ../../modules/core/greetd.nix
    ../../modules/core/systemd-boot.nix
    ../../modules/core/boot.nix
    ../../modules/core/systemd.nix
    ../../modules/core/security.nix
    ../../modules/core/bluetooth.nix
    ../../modules/core/printing.nix
    ../../modules/core/flatpak.nix
    ../../modules/core/audio.nix
    ../../modules/core/disk.nix
    ../../modules/core/fonts.nix
    ../../modules/core/virtualisation.nix
    #################################################################
    ###                         Programs                          ### 
    #################################################################
    ../../modules/program/cli/keyd/default.nix
    ../../modules/program/cli/lazygit/default.nix
    ../../modules/program/media/obs-studio/default.nix
    ../../modules/program/electronics/kicad/deault.nix
    # ---------------- Editor --------------
    # Moved to home-manager level to support declarative extensions
    # ---------------- Desktop Enviroment --------------
    ../../modules/program/desktop/${vars.desktop}/default.nix
    # ---------------- Theme --------------
    ../../modules/program/theme/noctalia/system.nix
    # ---------------- Shell --------------
    ../../modules/program/shell/zsh/default.nix
    # ---------------- Dev --------------
    ../../modules/program/dev/ollama/default.nix
    ../../modules/program/dev/mysql/default.nix
    ../../modules/program/editor/zed/default.nix
    #################################################################
    ###                         Packages                          ### 
    #################################################################
    ../../modules/packages/apps/default.nix
  ] ++ (builtins.map (lang: ../../modules/program/languages/${lang}/default.nix) (builtins.attrNames vars.languages));



  #### SYSTEM ####
  networking.hostName = vars.hostName;
  time.timeZone = vars.timeZone;
  networking.enableIPv6 = true;

  system.stateVersion = vars.stateVersion;
}
