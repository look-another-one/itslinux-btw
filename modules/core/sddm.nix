{ pkgs, ... }: {

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "SilentSDDM"; 

    extraPackages = with pkgs.kdePackages; [
      qtdeclarative
      qtsvg
      qtmultimedia
      pkgs.kdePackages.qtvirtualkeyboard  
    ];
  };

  environment.systemPackages = [
    (pkgs.stdenvNoCC.mkDerivation {   
      name = "sddm-theme-silentsddm";
      src = ../../config/themes/SilentSDDM;

      dontUnpack = true;   

      installPhase = ''
        runHook preInstall
        mkdir -p $out/share/sddm/themes/SilentSDDM
        cp -a --no-preserve=mode,ownership $src/. $out/share/sddm/themes/SilentSDDM/
        runHook postInstall
      '';
    })
  ];
}
