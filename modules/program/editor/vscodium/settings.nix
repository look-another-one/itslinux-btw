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
  "workbench.colorTheme" = "Catppuccin Mocha";
  "workbench.statusBar.visible" = true;
  "workbench.activityBar.location" = "top";
  "editor.minimap.enabled" = false;
  "breadcrumbs.enabled" = false;
  "workbench.layoutControl.enabled" = false;
  "window.menuBarVisibility" = "toggle";
  "workbench.editor.showTabs" = "single";
  "explorer.openEditors.visible" = 0;
  "workbench.startupEditor" = "none";
  "editor.cursorBlinking" = "phase";
  "editor.cursorSmoothCaretAnimation" = "on";

  # Vim configuration
  "vim.leader" = "<space>";
  "vim.normalModeKeyBindingsNonRecursive" = [
    {
      "before" = ["<leader>" "f" "f"];
      "commands" = ["workbench.action.quickOpen"];
    }
    {
      "before" = ["<leader>" "b"];
      "commands" = ["workbench.action.showAllEditorsByMostRecentlyUsed"];
    }
  ];
}
