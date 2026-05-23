{ config, pkgs, ... }:

{
  services.keyd = {
    enable = true;

    keyboards = {
      default = {
        ids = [ "*" ];

        settings = {
          main = {
            up    = "slash";
            slash = "up";
          };
        };
      };
    };
  };
}