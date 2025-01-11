#
# Configuration of the display server, Wayland. ANd the Display Manager alike.
# DOCS: https://www.drakerossman.com/blog/wayland-on-nixos-confusion-conquest-triumph https://www.youtube.com/watch?v=61wGzIv12Ds
{ config, pkgs, lib, device, ... }:
{

  hardware.graphics.enable = true; # Para que no de errores wayland
  security.polkit.enable = true; # Para permisos granulados entre procesos no priv to priv

  environment.systemPackages = with pkgs; [
    # Bare requirements
    hyprland # Compositor
    xwayland # Run X11 apps in Wayland
    greetd.tuigreet


    # Nice stuff
    libnotify # mako dependency

    waybar
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Wayland fix for electron apps.

#        --user-menu \        
  services.greetd = {
    enable = true;
    settings = {

    
     default_session = {
      command = ''
      ${pkgs.greetd.tuigreet}/bin/tuigreet \
        --time \
        --remember \
        --remember-session \
        --asterisks \
        --sessions "${pkgs.hyprland}/share/wayland-sessions" \
        --theme "border=gray;text=darkgray;prompt=lightgreen;time=gray;action=lightgreen;button=gray;container=darkgray;input=white" \
        --cmd hyprland
      '';
     };
     user = "greeter";

    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };


  # Las opciones en la barra de seleccion
  environment.etc."greetd/environments".text = ''
    hyprland
  '';

  # Permisos
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-gnome  ];
  xdg.portal.config.common.default = "*";
}
