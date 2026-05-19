{ pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
  vscodeExts = inputs.nix-vscode-extensions.extensions.${system};
in {
  programs.vscodium = {
    enable = true;

    profiles.default = {
      extensions = import ./extensions.nix { inherit vscodeExts; };
      userSettings = import ./settings.nix { inherit pkgs; };
    };
  };
}
