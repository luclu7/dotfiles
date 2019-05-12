# Edit this configuration file to define what should be installed on
# your system.	Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix
		];

	# Use the GRUB 2 boot loader.
	boot.loader.grub.enable = true;
	boot.loader.grub.version = 2;
	# boot.loader.grub.efiSupport = true;
	# boot.loader.grub.efiInstallAsRemovable = true;
	# boot.loader.efi.efiSysMountPoint = "/boot/efi";
	# Define on which hard drive you want to install Grub.
	boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

	networking.hostName = "NiX240"; # Define your hostname.
	# networking.wireless.enable = true;	# Enables wireless support via wpa_supplicant.
	networking.networkmanager.enable = true;

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Select internationalisation properties.
	i18n = {
		consoleFont = "Lat2-Terminus16";
		consoleKeyMap = "fr";
		defaultLocale = "fr_FR.UTF-8";
	};

	# Set your time zone.
	time.timeZone = "Europe/Paris";

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
	wget
	vim
	htop
	firefox
	chromium
	networkmanagerapplet
	git
	stow
	pulseaudio
	neofetch
	fish
	xcwd
	upower
	nethack
	dwm
	tdesktop redshift
	xorg.xbacklight
	xorg.xev
	xorg.xdpyinfo
	glxinfo
	pa_applet
	xclip
	udiskie
	pa_applet
	sqlite
	unzip
	unrar
	gnumake
	xsel
	feh
	polybar
	sxiv
	rsync
	libreoffice-fresh
	nload
	inxi
	psmisc
	python
	gnupg
	lm_sensors
	gnome3.gnome-screenshot
	];

	fonts = {
		enableFontDir = true;
		enableGhostscriptFonts = true;
		fonts = with pkgs; [
			anonymousPro
			noto-fonts-emoji
			corefonts
			dejavu_fonts
			noto-fonts
			freefont_ttf
			google-fonts
			hack-font
			inconsolata
			liberation_ttf
			powerline-fonts
			source-code-pro
			terminus_font
			ttf_bitstream_vera
			ubuntu_font_family
		];
	};

	systemd.user.services."dunst" = {
		enable = true;
		description = "";
		wantedBy = [ "default.target" ];
		serviceConfig.Restart = "always";
		serviceConfig.RestartSec = 2;
		serviceConfig.ExecStart = "${pkgs.dunst}/bin/dunst -config /home/luclu7/.config/dunstrc";
	};

	programs.fish.enable = true;

	nixpkgs.config.dwm.patches =	[
		/home/luclu7/patches/dwm/test.diff
	];
	nixpkgs.config.allowUnfree = true; 

	security.sudo.wheelNeedsPassword = false;
	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	services.openssh.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# Enable CUPS to print documents.
	# services.printing.enable = true;

	# Enable sound.
	sound.enable = true;
	hardware.pulseaudio.enable = true;

		# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.luclu7 = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
	};

	# This value determines the NixOS release with which your system is to be
	# compatible, in order to avoid breaking some software such as database
	# servers. You should change this only after NixOS release notes say you
	# should.
	system.stateVersion = "19.03"; # Did you read the comment?

	# Customs stuff

	services.xserver = {
	enable = true;

	desktopManager = {
	default = "none";
	xterm.enable = false;
	};


	windowManager.i3 = {
	enable = true;
	extraPackages = with pkgs; [
		dmenu
		j4-dmenu-desktop
		rofi
		termite
		i3status
		compton
	];
	};
# Enable the X11 windowing system.
	layout = "fr";
	# services.xserver.xkbOptions = "eurosign:e";

	# Enable touchpad support.
	libinput.enable = true;

	# Enable the KDE Desktop Environment.
	displayManager.sddm.enable = false;
	desktopManager.plasma5.enable = false;

	displayManager.lightdm.enable = true;


};

 services.upower.enable = true;
	
	services.redshift = {
		enable = true;
		latitude = "48.8534";
		longitude = "2.3488";
	};
		users.extraUsers.luclu7 = {
			shell = pkgs.fish;
		};


}