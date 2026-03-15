{ pkgs, ... }:

{
  home.packages = with pkgs; [ neovim ];
  xdg.configFile."neovim".source = ../../../../config/configfiles/nvim;
}
