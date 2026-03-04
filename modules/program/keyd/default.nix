{ config, pkgs, ... }:

{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];

        settings = {
          main = {
            # Simple bidirectional swap: pressing Esc acts as Caps Lock and vice versa
            capslock = "esc";
            esc      = "capslock";
          };
        };
      };
    };
  };


}