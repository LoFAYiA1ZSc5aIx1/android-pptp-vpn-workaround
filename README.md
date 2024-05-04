# Android PPTP VPN Workaround

This script provides a workaround for using PPTP VPN servers on newer versions of Android that no longer support PPTP VPN connections.

## Usage

To use this workaround, follow these steps:

1. Replace the `username`, `password`, and `domain` variables in both scripts with your own credentials.
2. Run `connect.sh` as root to establish a connection to the VPN server.
3. Once connected, run `route.sh` as root to set up routing rules for VPN traffic.

## Requirements

- root access
- `ip` command-line tool
- `mtpd` command-line tool"?
