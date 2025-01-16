{

	description = "This is JaxOS.";

inputs = {
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

  sops-nix = {
    url = "github:Mic92/sops-nix";
    
  };

  home-manager = {
    url = "github:nix-community/home-manager/release-24.11";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  nixvim = {
    url = "github:nix-community/nixvim/nixos-24.11";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  nur.url = "github:nix-community/NUR";
};



	outputs = { self, nixpkgs, home-manager, nur, nixvim, sops-nix,  ...}:
		let
      username = "jaximo";
      device = "desktop";

			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = import nixpkgs { inherit system; };
		in {
      nixosConfigurations = {

				desktop = lib.nixosSystem {
					inherit system;
          specialArgs = { inherit username ; device = "desktop"; };

					modules = [
            ./system/configuration.nix
						./system/hardware/desktop.nix
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops
             {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${username} = {
                  imports = [
                    nur.hmModules.nur
                    nixvim.homeManagerModules.nixvim
                    
                    ./home/default-home.nix
                    ]; 
                };
                home-manager.extraSpecialArgs = { inherit username ; device = "desktop"; };
                home-manager.backupFileExtension = "backup";
             }
          ];
				};

				laptop = lib.nixosSystem {
					inherit system;
          specialArgs = { inherit username ; device = "laptop"; };

					modules = [
            ./system/configuration.nix
						./system/hardware/laptop.nix
            sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
             {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${username} = {
                  imports = [
                    nur.hmModules.nur
                    nixvim.homeManagerModules.nixvim
                    ./home/default-home.nix
                    ]; 
                };
                home-manager.extraSpecialArgs = { inherit username ; device = "laptop"; };
                home-manager.backupFileExtension = "backup";
             }
          ];
				};
        
			};
	};

}
