{ pkgs, inputs, ... }:

let
  system = pkgs.system;
  vscodeExts = inputs.nix-vscode-extensions.extensions.${system};
in {
  programs.vscodium = {
    enable = true;

    profiles.default = {
      extensions = [
        vscodeExts.vscode-marketplace.eamodio.gitlens
        vscodeExts.vscode-marketplace.ms-python.python
        vscodeExts.vscode-marketplace.rust-lang.rust-analyzer
      ];

      userSettings = {
        "terminal.integrated.defaultProfile.linux" = "nushell";
        "terminal.integrated.profiles.linux" = {
          "nushell" = {
            "path" = "${pkgs.nushell}/bin/nu";
          };
        };
      };
    };
  };
}
