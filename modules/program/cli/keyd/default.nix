{ config, pkgs, ... }:

{
  services.keyd = {
    enable = true;

    keyboards = {
      default = {
        ids = [ "*" ];

        settings = {
          main = {
            # CapsLock <-> Esc
            capslock = "esc";
            esc      = "capslock";

            # Up Arrow <-> /?
            up       = "slash";
            slash    = "up";
          };
        };
      };
    };
  };
}