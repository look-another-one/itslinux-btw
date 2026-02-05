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
    # 1. Added 'silentSDDM' to the arguments above
    
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      # It is good practice to specify system, e.g.:
      # system = "x86_64-linux"; 
      
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

        # 2. Import the SilentSDDM Module here
        silentSDDM.nixosModules.default

        # 3. Configure the options here (inside a module set)
        {
          programs.silentSDDM = {
            enable = true;
            theme = "rei";
            # settings = { ... }; 
          };
        }
      ];
    };
  };
}
