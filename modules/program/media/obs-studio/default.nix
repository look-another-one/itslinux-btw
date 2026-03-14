{ config, pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      obs-backgroundremoval   # ← this is the background removal plugin
      # Add others if you want, e.g.:
      # wlrobs                  # Wayland capture
      # obs-pipewire-audio-capture
      # obs-composite-blur
      # obs-shaderfilter
    ];
  };
}