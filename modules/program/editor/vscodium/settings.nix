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
  "code-runner.clearPreviousOutput" = true;
  "workbench.iconTheme" = "vscode-icons";
  "editor.fontFamily" = "JetBrains Mono, Cascadia Code, monospace";
  "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
  "workbench.colorTheme" = "Dracula Theme";
}
