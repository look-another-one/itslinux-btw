{ pkgs, ... }: {

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "SilentSDDM";  # ← folder name must match exactly

    extraPackages = with pkgs.kdePackages; [
      qtdeclarative
      qtsvg
      qtmultimedia
      pkgs.kdePackages.qtvirtualkeyboard
      # qt5compat   # ← add this if you see import/version errors later
    ];
  };

  environment.systemPackages = [
    (pkgs.stdenvNoCC.mkDerivation {   # ← stdenvNoCC is faster / cleaner for pure data
      name = "sddm-theme-silentsddm";
      src = ../config/themes/SilentSDDM;

      dontUnpack = true;   # ← optional but good if src is already ready

      installPhase = ''
        runHook preInstall
        mkdir -p $out/share/sddm/themes/SilentSDDM
        cp -a --no-preserve=mode,ownership $src/. $out/share/sddm/themes/SilentSDDM/
        runHook postInstall
      '';
    })
  ];
}
