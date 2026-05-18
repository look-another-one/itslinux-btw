{ pkgs, vars, ... }:

let
  browserDesktop = if vars.browser == "brave" then "brave-browser.desktop" else "${vars.browser}.desktop";
  editorDesktop = if vars.editor == "vscodium" then "codium.desktop" else if vars.editor == "neovim" then "nvim.desktop" else "${vars.editor}.desktop";
  editorCmd = if vars.editor == "vscodium" then "codium" else vars.editor;
in
{
  home.sessionVariables = {
    EDITOR = editorCmd;
    VISUAL = editorCmd;
    BROWSER = vars.browser;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = [ editorDesktop ];
      "text/html" = [ browserDesktop ];
      "text/xml" = [ browserDesktop ];
      "x-scheme-handler/http" = [ browserDesktop ];
      "x-scheme-handler/https" = [ browserDesktop ];
      "x-scheme-handler/about" = [ browserDesktop ];
      "x-scheme-handler/unknown" = [ browserDesktop ];
      "application/x-extension-htm" = [ browserDesktop ];
      "application/x-extension-html" = [ browserDesktop ];
      "application/x-extension-shtml" = [ browserDesktop ];
      "application/xhtml+xml" = [ browserDesktop ];
      "application/x-extension-xhtml" = [ browserDesktop ];
      "application/x-extension-xht" = [ browserDesktop ];
    };
  };
}
