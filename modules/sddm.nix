{ pkgs, ... }: {
 services.displayManager.sddm = {
   enable = true;
   wayland.enable = true;
   # Use the Qt6 version of SDDM
   package = pkgs.kdePackages.sddm; 
   # Set the internal theme name
   theme = "sddm-astronaut";
  
  # Critical: This adds the theme files AND its Qt6 dependencies
   extraPackages = [ 
    pkgs.sddm-astronaut
    pkgs.kdePackages.qtmultimedia # Often required for astronaut
    pkgs.kdePackages.qtsvg        # Required for icons/images
  ];
};

}


