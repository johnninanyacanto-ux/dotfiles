#!/bin/sh
# Cambia 'ens33' por el nombre de tu interfaz si es distinto (mira 'ip addr')
IP=$(ip addr show enp2s0 2>/dev/null | grep "inet " | awk '{print $2}' | cut -d/ -f1)

if [ -z "$IP" ]; then
    echo "{\"text\": \"<span color='#2495e7'>󰈀</span> Disconnected\", \"class\": \"ethernet\"}"
else
    echo "{\"text\": \"<span color='#2495e7'>󰈀</span> $IP\", \"class\": \"ethernet\"}"
fi
