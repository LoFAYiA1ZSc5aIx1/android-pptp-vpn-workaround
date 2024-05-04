#!/bin/sh

if [ $(id -u) -eq 0 ]; then
    route_info=$(ip route get 8.8.8.8)

    domain="example.com"

    gateway=$(echo "$route_info" | awk '{for(i=1; i<=NF; i++) {if ($i=="via") print $(i+1)}}')
    interface=$(echo "$route_info" | awk '{for(i=1; i<=NF; i++) {if ($i=="dev") print $(i+1)}}')
    server_ip=$(ping -c 1 "$domain" | awk -F'[()]' '/PING/{print $2}')

    ip route add "$server_ip" via "$gateway" dev "$interface" proto static table "$interface"
    echo "Added route for "$server_ip" via "$gateway" on interface "$interface"."

    ip route del default table "$interface"
    echo "Deleted default route from routing table "$interface"."

    ip route add default dev ppp0 table "$interface"
    echo "Added new default route to routing table "$interface"."
else
    echo "Root access is required."
fi