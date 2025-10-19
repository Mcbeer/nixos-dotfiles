{ config, pkgs, ... }:

{
	home.username = "nicolai";
	home.homeDirectory = "/home/nicolai";
	home.stateVersion = "25.05";
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
}
