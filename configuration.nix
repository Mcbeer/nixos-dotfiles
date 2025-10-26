{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nicolai-linux";
  networking.networkmanager.enable = true;
  
  time.timeZone = "Europe/Copenhagen";

  users.users.nicolai = {
	isNormalUser = true;
	extraGroups = ["wheel"];
	packages = with pkgs; [
		tree
	];
  };

  services.getty.autologinUser = "nicolai";

  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
  };

  programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = "*";
  };

  # Polkit for authentication dialogs
  security.polkit.enable = true;
  
  nixpkgs.config.allowUnfree = true;
  hardware.nvidia.open = false;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;

  console.keyMap = "dk";

  programs.firefox.enable = true;
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    kitty
    waybar
    git
    hyprpaper
    wofi
    lutris
    wine
    winetricks
    neovim
    xfce.thunar
    pkgs.umu-launcher
    pkgs.wowup-cf
    xwayland-satellite
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";

}

