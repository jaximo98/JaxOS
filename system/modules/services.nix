#
# Configure and set up networks.
#
{ config, ... }:
{

  systemd.services.reminder = {
    description = "Recordatorio cada hora en punto";
    script = ''
      #!/bin/bash
      /home/jaximo/JaxOS/scripts/oclock.sh
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
