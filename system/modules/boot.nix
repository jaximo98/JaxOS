{ config, pkgs, device, ... }:
{
	# Define GRUB as boot loader.
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.timeout = 15;

	boot.loader.grub = {
		enable = true;	
		useOSProber = true;
		efiSupport = true;
		device = "nodev";
		gfxmodeEfi = if (device == "desktop") then "2560x1440" else "1920x1080";
		fontSize = 42;
		configurationLimit = 20;
		extraEntriesBeforeNixOS = true;
		default = "Windows Boot Manager";
	};


  # Habilitar soporte para NTFS al arranque
  boot.supportedFilesystems = [ "ntfs" ];

}
