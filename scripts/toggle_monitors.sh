#!/bin/bash
# toggle_monitor.sh

# Comprueba si HDMI-A-1 está deshabilitado
if hyprctl monitors all | grep -q "HDMI-A-1.*disabled"; then
    # Si está deshabilitado, lo habilita con su resolución preferida, posición automática y escala 1
    hyprctl keyword monitor "HDMI-A-1,preferred,auto,1"
    notify-send "Monitor HDMI-A-1 activado"
else
    # Si está habilitado, lo deshabilita
    hyprctl keyword monitor "HDMI-A-1,disabled"
    notify-send "Monitor HDMI-A-1 desactivado"
fi
