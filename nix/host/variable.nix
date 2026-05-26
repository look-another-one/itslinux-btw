{
  # Core System Settings
  hostName = "nixos-btw";
  timeZone = "Asia/Karachi";
  stateVersion = "25.11";
  homeStateVersion = "25.05";

  # Default Applications
  browser = "brave";
  editor = "vscodium";
  desktop = "niri";
  imageViewer = "imv";
  videoPlayer = "mpv";

  # Cursor Configuration
  cursor = {
    name = "Bibata-Modern-Classic";
    package = "bibata-cursors";
    size = 24;
  };

  # Languages
  languages = {
    nodejs = "20";
    python = "314";
    cpp = "20";
  };
}

