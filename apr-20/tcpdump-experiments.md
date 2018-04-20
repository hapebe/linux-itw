# TCPdump

First I generated some captured network traffic using this command:
```
sudo tcpdump -i enp2s0 -n -w tcpdump.cap
# give the ordinary user all privileges for the capture file:
sudo chown hapebe:itw tcpdump.cap
```

Then I can again generate the analysis log of this traffic:
```
tcpdump -n -r tcpdump.cap > tcpdump.log
# only IPv4 and IPv6:
tcpdump -n -r tcpdump.cap ip|ip6 > tcpdump.log
```

Show all source addresses:
```
cut -d" " -f3 tcpdump.log | sort | uniq
```

Find all unique IPv4 from-addresses:
```
tcpdump -n -r tcpdump.cap ip > tcpdump.log
cut -d" " -f3 tcpdump.log | sort -n | uniq > ipv4-with-port.log
cut -d. -f1,2,3,4 ipv4-with-port.log | sort -n | uniq > ipv4-unique.log
cut -d. -f5 ipv4-with-port.log | sort -n | uniq > ipv4-ports-unique.log
```
