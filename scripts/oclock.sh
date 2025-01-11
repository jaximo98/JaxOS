#!/usr/bin/env bash

# Obtiene la hora actual en formato HH:MM
hora_actual=$(date +"%H:%M")
# Obtiene el tiempo de actividad del sistema
tiempo_encendido=$(uptime | awk -F'( |,|:)+' '{print $6 " horas, " $7 " minutos"}')

# Envía la notificación con la hora actual como subtítulo
notify-send "Ha pasado una hora desde la ultima notifiacion." \
    "Son las: <u>$hora_actual</u>, llevas en el PC: $tiempo_encendido." \
    --hint=int:transient:5

# Reproduce el audio bell de kitty
echo -e "\a"
