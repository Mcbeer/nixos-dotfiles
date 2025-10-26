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
			btw = "echo i use hyprland btw";
		};
		profileExtra = ''
			if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
				echo "Select Window Manager:"
				echo "1) Hyprland"
				echo "2) Niri"
				read -p "Choice (1-2): " choice
				case $choice in
					1) exec Hyprland ;;
					2) exec niri --session ;;
					*) echo "Invalid choice" ;;
				esac
			fi
		'';
	};
	xdg.configFile = {
		"hypr".source = ./.config/hypr;
		"niri".source = ./.config/niri;
    		"waybar".source = ./.config/waybar;
		"wofi".source = ./.config/wofi;
	};
}
