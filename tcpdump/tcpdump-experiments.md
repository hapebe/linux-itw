# TCPdump
Preparation:
`netstat -i` shows (among other facts) the promiscuous flag for the 
network interfaces. In my system, it was not enabled, so I used 
`ip link set enp2s0 promisc on`

First I generated some captured network traffic using this command:
```
sudo tcpdump -i enp2s0 -n -w tcpdump.cap
# give the ordinary user all privileges for the capture file:
sudo chown hapebe:itw tcpdump.cap
```

Found out: I can also open such .cap files in WireShark.


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
tcpdump -n -r tcpdump.cap ip > tcpdump-ipv4.log
cut -d" " -f3 tcpdump-ipv4.log | sort -n | uniq > ipv4-with-port.log
cut -d. -f1,2,3,4 ipv4-with-port.log | sort -n | uniq > ipv4-unique.log
cut -d. -f5 ipv4-with-port.log | sort -n | uniq > ipv4-ports-unique.log
```
