{ config, pkgs, device, ... }:
let 
  # Ruta al logo de NixOS que deseas utilizar
  nixosLogo = ../../themes/jx-logo.png;

  # Derivación personalizada del tema Tartarus
  tartarusTheme = pkgs.stdenv.mkDerivation {
    pname = "tartarus-grub-theme";
    version = "1.0";
    src = pkgs.fetchFromGitHub {
      owner = "AllJavi";
      repo = "tartarus-grub";
      rev = "b116360a2a0991062a4d728cb005dfd309fbb82a";
      sha256 = "0igy1aqp3v2v8gqqlk0p5i78g9l3xz19fh3aigafbk7k3p8ypz7w";
    };
    phases = [ "unpackPhase" "installPhase" ];
    installPhase = ''
      mkdir -p $out/share/grub/themes/tartarus
      cp -r $src/tartarus/* $out/share/grub/themes/tartarus/
      cp ${nixosLogo} $out/share/grub/themes/tartarus/nixos-logo.png
      sed -i 's|logo.png|nixos-logo.png|g' $out/share/grub/themes/tartarus/theme.txt
    '';
  };
in {
	
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
		theme = tartarusTheme;
	};


  # Habilitar soporte para NTFS al arranque
  boot.supportedFilesystems = [ "ntfs" ];

}