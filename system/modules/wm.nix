# wm, usando i3.
{ config, pkgs, ... }:
{
  # i3 configuration
  environment.pathsToLink = ["/libexec"];

  # Configure keymap in X11
  services.xserver = {
    enable = true;

/* MOVED TO HOME MANAGER XSESSION
    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [ i3lock ];
    };
  };


  # Default session
  services.displayManager.defaultSession = "none+i3";
*/
  };
}