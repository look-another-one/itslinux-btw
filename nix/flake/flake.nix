{
  description = "its flakes btw";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };



  };

  outputs = { self, nixpkgs, home-manager, stylix, zen-browser, ... }: 
  let
    vars = import ../host/variable.nix;
  in { 
    
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit vars zen-browser; };
      modules = [
        ../config/configuration.nix
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit vars zen-browser; };
            users.yousaytoday = import ../home-men/home.nix;
            backupFileExtension = "nixbak";
          };
        }

      ];
    };
  };
}
