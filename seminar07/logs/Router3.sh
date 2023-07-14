Router>en
Router#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
Router(config)#int gi
Router(config)#int gigabitEthernet 0/0/0
Router(config-if)#no shu
Router(config-if)#no shutdown 

Router(config-if)#
%LINK-5-CHANGED: Interface GigabitEthernet0/0/0, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface GigabitEthernet0/0/0, changed state to up

Router(config-if)#ip address 10.0.0.1 255.255.0.0
Router(config-if)#ip nat inside
Router(config-if)#ex
Router(config)#int gi
Router(config)#int gigabitEthernet 0/0/1
Router(config-if)#no shu
Router(config-if)#no shutdown 

Router(config-if)#
%LINK-5-CHANGED: Interface GigabitEthernet0/0/1, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface GigabitEthernet0/0/1, changed state to up

Router(config-if)#ip address 8.8.8.2 255.255.255.252
Router(config-if)#ip nat outside
Router(config-if)#ex
Router(config)#
Router(config)#do wr
Building configuration...
[OK]
Router(config)#
Router(config)#router ospf 1
Router(config-router)#router-id 3.3.3.3
Router(config-router)#net
Router(config-router)#network ?
  A.B.C.D  Network number
Router(config-router)#network 8.8.8.0 0.0.0.3 ?
  area  Set the OSPF area ID
Router(config-router)#network 8.8.8.0 0.0.0.3 area 0
Router(config-router)#
01:28:31: %OSPF-5-ADJCHG: Process 1, Nbr 6.6.6.6 on GigabitEthernet0/0/1 from LOADING to FULL, Loading Done

Router(config-router)#ex
Router(config)#ip nat ?
  inside   Inside address translation
  outside  Outside address translation
  pool     Define pool of addresses
Router(config)#ip nat ins
Router(config)#ip nat inside ?
  source  Source address translation
Router(config)#ip nat inside sou
Router(config)#ip nat inside source ?
  list    Specify access list describing local addresses
  static  Specify static local->global mapping
Router(config)#ip nat inside source sta
Router(config)#ip nat inside source static ?
  A.B.C.D  Inside local IP address
  tcp      Transmission Control Protocol
  udp      User Datagram Protocol
Router(config)#ip nat inside source static tcp ?
  A.B.C.D  Inside local IP address
Router(config)#ip nat inside source static tcp 172.16.0.100 ?
  <1-65535>  Local UDP/TCP port
Router(config)#ip nat inside source static tcp 172.16.0.100 80 ?
  A.B.C.D  Inside global IP address
Router(config)#ip nat inside source static tcp 172.16.0.100 80 8.8.8.2 80
Router(config)#ip nat inside source static tcp 172.16.0.101 443 8.8.8.2 443
Router(config)#do wr
Building configuration...
[OK]
Router(config)#
Router(config)#
