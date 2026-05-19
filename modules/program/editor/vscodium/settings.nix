{ pkgs, ... }:

{
  "editor.mouseWheelZoom" = true;
  "files.autoSave" = "afterDelay";
  "files.autoSaveDelay" = 1000;
  "terminal.integrated.defaultProfile.linux" = "zsh";
  "terminal.integrated.profiles.linux" = {
    "zsh" = {
      "path" = "${pkgs.zsh}/bin/zsh";
    };
  };
}
