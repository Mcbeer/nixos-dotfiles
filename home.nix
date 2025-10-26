{ config, pkgs, ... }:

{
	home.username = "nicolai";
	home.homeDirectory = "/home/nicolai";
	home.stateVersion = "25.05";
	home.packages = with pkgs; {
		zed-editor
	};
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use hyprland btw";
		};
		profileExtra = ''
        		if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
          			exec Hyprland
        		fi
      		'';
	};
	xdg.configFile = {
		"hypr".source = ./.config/hypr;
    		"waybar".source = ./.config/waybar;
		"wofi".source = ./.config/wofi;
	};
}
