{ config, pkgs, ags, astal, ... }:

{
	imports = [ ags.homeManagerModules.default ];

	home.username = "nicolai";
	home.homeDirectory = "/home/nicolai";
	home.stateVersion = "25.05";
	home.packages = with pkgs; [
		zed-editor
	];
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use niri btw";
		};
	};
	
	programs.ags = {
		enable = true;
		configDir = ./.config/ags;
		extraPackages = with pkgs; [
			# Add any extra Astal packages needed
		];
	};
	
	xdg.configFile = {
		"niri".source = ./.config/niri;
		"wofi".source = ./.config/wofi;
	};

}
