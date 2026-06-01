{ inputs, user, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = (builtins.fromJSON (builtins.readFile ../../../../config/configfiles/noctalia/state.json)).settings;
  };
}
