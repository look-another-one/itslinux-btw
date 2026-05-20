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
    enableClipboardPaste = true;
    enableCalendarEvents = false;
          
  };
  powerManagement.enable = true; 
  services.thermald.enable = true; 
} 
