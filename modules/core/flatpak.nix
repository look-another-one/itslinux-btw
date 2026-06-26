{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;
    packages = [
      { appId = "md.obsidian.Obsidian"; origin = "flathub"; }
    ];
  };

}
