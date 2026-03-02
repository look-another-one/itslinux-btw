{ pkgs, ... }: {
 services.displayManager.sddm = {
   enable = true;
   wayland.enable = true;
   # Use the Qt6 version of SDDM
   package = pkgs.kdePackages.sddm; 
   # Set the internal theme name
   theme = "silent";
  
  # Critical: This adds the theme files AND its Qt6 dependencies
   extraPackages = [ 
    pkgs.kdePackages.qtmultimedia # Often required for astronaut
    pkgs.kdePackages.qtsvg        # Required for icons/images
  ];
};
      #installing sddm theme
      programs.silentSDDM = {
        enable = true;
        theme = "rei";
        # settings = { ... }; see example in module
    };

}


