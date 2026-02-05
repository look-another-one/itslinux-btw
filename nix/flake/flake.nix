{
  description = "its flakes btw";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: { 
    # 1. Added 'silentSDDM' to the arguments above
    
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      
      modules = [
        ../conf/configuration.nix
        
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.yousaytoday = import ../home-men/home.nix;
            backupFileExtension = "nixbak";
          };
        }
      ];
    };
  };
}
