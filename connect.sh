#!/bin/sh

if [ $(id -u) -eq 0 ]; then
	domain="example.com"
	user=""
	pass=""

	route_info=$(ip route get 8.8.8.8)
	interface=$(echo "$route_info" | awk '{for(i=1; i<=NF; i++) {if ($i=="dev") print $(i+1)}}')
	
	mtpd "$interface" pptp "$domain" 1723 linkname vpn name "$user" password "$pass" refuse-eap nobsdcomp nodefaultroute usepeerdns idle 1800 mtu 1400 mru 1400
else
    echo "Root access is required."
fi