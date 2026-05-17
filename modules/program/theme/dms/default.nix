{ config, pkgs, inputs, ... }: # Make sure 'inputs' is passed if pulling from a plugin registry flake
{
  programs.dms-shell = {
    enable = true;

    systemd = {
      enable = true;            
      restartIfChanged = true; 
    };
    
    enableSystemMonitoring = true; 
    enableVPN = true;                  
    enableDynamicTheming = true;       
    enableClipboardPaste = true;       
  };
  powerManagement.enable = true; 
  services.thermald.enable = true; 
} 
