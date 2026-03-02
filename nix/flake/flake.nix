{
  description = "its flakes btw";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
   };

  };

  outputs = { self, nixpkgs, home-manager, silentSDDM, ... }: { 
    
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      
      modules = [
        ../conf/configuration.nix
        home-manager.nixosModules.home-manager
        silentSDDM.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.yousaytoday = import ../home-men/home.nix;
            backupFileExtension = "nixbak";
          };

      #installing sddm theme
      programs.silentSDDM = {
        enable = true;
        theme = "rei";
        # settings = { ... }; see example in module
    };
          
        }

      ];
    };
  };
}
