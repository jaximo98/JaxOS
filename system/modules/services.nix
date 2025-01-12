#
# Configure and set up networks.
#
{pkgs, config, ... }:
{

  systemd.services.reminder = {
    description = "Recordatorio cada hora en punto";
    path = with pkgs; [ bash ];
    script = ''
      bash /home/jaximo/JaxOS/scripts/oclock.sh
    '';
    serviceConfig = {
      Type = "oneshot";
    };
    wantedBy = [ "timers.target" ];
  };

  systemd.timers.recordatorio = {
    description = "Lanza recordatorio cada hora en punto";
    timerConfig = {
      OnCalendar = "*-*-* *:00:00";
      Persistent = true;
    };
    wantedBy = [ "timers.target" ];
  };
}
