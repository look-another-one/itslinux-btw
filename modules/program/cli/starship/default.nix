{ pkgs, ... }: {
  programs.starship = {
    enable = true;
  };

  xdg.configFile."starship.toml".source = ../../../../config/configfiles/starship/starship.toml;
}