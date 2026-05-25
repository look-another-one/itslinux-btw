{ config, pkgs, ... }:

{
  services.activitywatch = {
    enable = true;
    watchers = {
      aw-watcher-afk = {};
      aw-watcher-window-wayland = {
        package = pkgs.aw-watcher-window-wayland;
      };
    };
  };
}
