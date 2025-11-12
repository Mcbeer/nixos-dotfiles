{
	description = "Niri on NixOS";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		astal = {
			url = "github:aylur/astal";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		ags = {
			url = "github:aylur/ags";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.astal.follows = "astal";
		};
	};

	outputs = { nixpkgs, home-manager, ags, astal, ... }: {
		nixosConfigurations.nicolai-linux = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.nicolai = import ./home.nix;
						backupFileExtension = "backup";
						extraSpecialArgs = { inherit ags astal; };
					};
				}
			];
		};
	};
}
