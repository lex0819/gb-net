Router>
Router>en
Router>enable 
Router#sh ip route
Codes: C - connected, S - static, I - IGRP, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2, E - EGP
       i - IS-IS, L1 - IS-IS level-1, L2 - IS-IS level-2, ia - IS-IS inter area
       * - candidate default, U - per-user static route, o - ODR
       P - periodic downloaded static route

Gateway of last resort is not set

C    192.168.20.0/24 is directly connected, FastEthernet0/0

Router#
Router#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
Router(config)#
Router(config)#interface loopback 0

Router(config-if)#
%LINK-5-CHANGED: Interface Loopback0, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface Loopback0, changed state to up

Router(config-if)#ip address 172.20.243.164 255.255.0.0
Router(config-if)#
Router(config-if)#interface loopback 1

Router(config-if)#
%LINK-5-CHANGED: Interface Loopback1, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface Loopback1, changed state to up

Router(config-if)#ip address 192.168.46.1 255.255.255.0
Router(config-if)#
Router(config-if)#interface loopback 3

Router(config-if)#
%LINK-5-CHANGED: Interface Loopback3, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface Loopback3, changed state to up

Router(config-if)#ip address 172.31.0.1 255.255.0.0
Router(config-if)#
Router(config-if)#exit
Router(config)#exit
Router#
%SYS-5-CONFIG_I: Configured from console by console

Router#sh ip route
Codes: C - connected, S - static, I - IGRP, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2, E - EGP
       i - IS-IS, L1 - IS-IS level-1, L2 - IS-IS level-2, ia - IS-IS inter area
       * - candidate default, U - per-user static route, o - ODR
       P - periodic downloaded static route

Gateway of last resort is not set

C    172.20.0.0/16 is directly connected, Loopback0
C    172.31.0.0/16 is directly connected, Loopback3
C    192.168.20.0/24 is directly connected, FastEthernet0/0
C    192.168.46.0/24 is directly connected, Loopback1

Router#
Router#