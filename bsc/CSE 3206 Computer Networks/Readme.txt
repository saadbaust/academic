CISCO Packet Tracer Simulator:

Router Basic:
	enable 
	configure t 

Router Configuration:
	hostname TOP
	enable password cisco
	enable secret cisco123
	line aux 0 + line console 0 + line vty 0 5
	password cisco123
	login 
	exit
	do wr

Router Interfacing:
	interface port_number
	ip address 192.168.1.x 255.255.25.x
	no shut
	do wr

Static Routing:
	ip route net_address subnet_mask next_hop
	do wr

Dynamic Routing RIP {connected network with 3rd part different}
	router rip
	network 192.168.1.0
	network 192.168.2.0
	network 192.168.3.0
	do wr

Dynamic Routing EIGRP {connected network with 3rd part different}
	router eigrp 20
	network 192.168.1.0
	network 192.168.2.0
	network 192.168.3.0
	do wr