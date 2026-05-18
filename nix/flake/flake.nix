{
  description = "its flakes btw";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    vars = import ../host/variable.nix;
    user = import ../host/user.nix;
  in {
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs vars user; };
      modules = [
        ../config/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs vars user; };
            users.${user.username} = import ../home-men/home.nix;
            backupFileExtension = "nixbak";
            
          };
        }
      ];
    };
  };
}
