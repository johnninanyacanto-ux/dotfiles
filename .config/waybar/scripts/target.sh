#!/bin/bash

# Asegúrate de que esta ruta es donde tu función 'settarget' guarda la IP
TARGET_FILE="$HOME/.config/bin/target"

if [ -f "$TARGET_FILE" ]; then
    ip_address=$(awk '{print $1}' "$TARGET_FILE")
    machine_name=$(awk '{print $2}' "$TARGET_FILE")

    if [ "$ip_address" ] && [ "$machine_name" ]; then
        echo "{\"text\": \"<span color='#e51d0b'>󰓾</span> $ip_address - $machine_name\"}"
    else
        echo "{\"text\": \"<span color='#e51d0b'>󰓾</span> No target\"}"
    fi
else
    echo "{\"text\": \"<span color='#e51d0b'>󰓾</span> No target\"}"
fi
