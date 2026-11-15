#!/usr/bin/env bash
net_UUID=534f83f8-76c5-49e1-bdc9-967c78a7434b
if ip a | grep -q 192.168.1.151; then
    nmcli con down vlan192 > /dev/null
    nmcli con up vlan20 > /dev/null
    echo "Changed IP to 172.22.20.130"
elif ip a | grep -q 172.22.20.130; then
    nmcli con down vlan20 > /dev/null
    nmcli con up vlan192 > /dev/null
    echo "Changed IP to 192.168.1.151"
fi
