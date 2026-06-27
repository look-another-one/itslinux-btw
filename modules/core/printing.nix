{ pkgs, ... }:

{
  #### PRINTING ####
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      hplip
      gutenprint
      brlaser
    ];
  };
}
