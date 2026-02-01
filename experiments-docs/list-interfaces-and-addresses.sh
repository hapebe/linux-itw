#!/bin/bash
set -euo pipefail

# List network interfaces and their IPv4 addresses using `ip -o a`.
#
# Usage:
#   list-interfaces-and-addresses.sh        # show interfaces that have IPv4 addresses
#   list-interfaces-and-addresses.sh --all  # show all interfaces, print '-' if none

if [[ "${1-}" == "--all" ]]; then
	ip -o link show | awk -F': ' '{print $2}' | while IFS= read -r iface; do
		addrs=$(ip -o -4 addr show dev "$iface" \
			| awk '{split($4,a,"/"); print a[1]}' \
			| paste -s -d, - 2>/dev/null || true)
		if [[ -z "$addrs" ]]; then
			addrs="-"
		fi
		printf '%s: %s\n' "$iface" "$addrs"
	done
else
	# Show only interfaces that have IPv4 addresses; group multiple addresses per interface
	ip -o -4 addr show \
		| awk '{split($4,a,"/"); add[$2] = (add[$2] ? add[$2] "," a[1] : a[1])} END {for (i in add) print i": " add[i]}' \
		| sort
fi
