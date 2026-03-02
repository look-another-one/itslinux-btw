{ pkgs, ... }: {
 services.displayManager.sddm = {
   enable = true;
   wayland.enable = true;
   # Use the Qt6 version of SDDM
   package = pkgs.kdePackages.sddm; 
  
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
  backgrounds = {
    loginVideo = ../assets/Wallpapers/video.mp4;
  };

  settings = {
    "LoginScreen" = {
      background = "video.mp4";
    };
  };      
};
}


