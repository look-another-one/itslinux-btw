{ pkgs, inputs, ... }:

{
  home.packages = [ inputs.otter-launcher.packages.${pkgs.system}.default ];
  
  xdg.configFile."otter-launcher/config.toml".source = ../../../../config/configfiles/otter-launcher/config.toml;
}
