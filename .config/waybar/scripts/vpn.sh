#!/bin/sh
IP=$(ip addr show tun0 2>/dev/null | grep "inet " | awk '{print $2}' | cut -d/ -f1)

if [ -n "$IP" ]; then
    echo "{\"text\": \"<span color='#1bbf3e'>󰆧</span> $IP\", \"class\": \"vpn\"}"
else
    echo "{\"text\": \"<span color='#1bbf3e'>󰆧</span> Disconnected\", \"class\": \"vpn\"}"
fi
