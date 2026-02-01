#!/bin/bash

# the simple & manual version:
# for x in $(hostname -I); do
# 	if [[ ! $x == *":"* ]] ; then
# 		echo IPv4 address: $x
# 	fi
# done

echo "IPv4 addresses:"

# AI generated version (reviewed / modified by human):
output=$(ip -o a)

# Loop through each line of the output
while IFS= read -r line; do
  # Extract the interface name and IPv4 address
  interface=$(echo "$line" | awk '{print $2}' | cut -d':' -f1)
  ipv4_address=$(echo "$line" | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

  if [ "$interface" == "lo" ]; then
	continue  # Skip loopback interface
  fi

  if [[ -z "$ipv4_address" ]]; then
	continue  # Skip if no IPv4 address found
  fi

  # Print:
  echo "$interface: $ipv4_address"
done <<< "$output"