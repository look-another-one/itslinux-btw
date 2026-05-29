{ config, pkgs, user, ... }:

{
  programs.zsh = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
	starship
  ];

  home-manager.users.${user.username} = {
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
  };
}

