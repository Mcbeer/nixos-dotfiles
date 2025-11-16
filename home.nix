{ config, pkgs, ... }:

{
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
	
	xdg.configFile = {
		"niri".source = ./.config/niri;
		"wofi".source = ./.config/wofi;
		"waybar".source = ./.config/waybar;
		"mako".source = ./.config/mako;
	};

}
