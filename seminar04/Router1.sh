Router#
Router#sh ip route
Codes: C - connected, S - static, I - IGRP, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2, E - EGP
       i - IS-IS, L1 - IS-IS level-1, L2 - IS-IS level-2, ia - IS-IS inter area
       * - candidate default, U - per-user static route, o - ODR
       P - periodic downloaded static route

Gateway of last resort is not set

C    10.0.0.0/8 is directly connected, FastEthernet0/0.320
O    172.17.0.0/16 [110/4] via 172.20.0.2, 00:44:26, FastEthernet0/1
                   [110/4] via 192.168.61.2, 00:44:26, FastEthernet1/0
O    172.18.0.0/16 [110/2] via 172.20.0.2, 03:09:56, FastEthernet0/1
     172.20.0.0/24 is subnetted, 1 subnets
C       172.20.0.0 is directly connected, FastEthernet0/1
O    192.168.6.0/24 [110/3] via 172.20.0.2, 00:44:26, FastEthernet0/1
                    [110/3] via 192.168.61.2, 00:44:26, FastEthernet1/0
O    192.168.16.0/24 [110/2] via 192.168.61.2, 00:44:26, FastEthernet1/0
C    192.168.61.0/24 is directly connected, FastEthernet1/0
C    192.168.100.0/24 is directly connected, FastEthernet0/0.300
C    192.168.200.0/24 is directly connected, FastEthernet0/0.330

Router#
Router#sh ip ospf int

FastEthernet0/1 is up, line protocol is up
  Internet address is 172.20.0.1/24, Area 0
  Process ID 1, Router ID 192.168.61.1, Network Type BROADCAST, Cost: 1
  Transmit Delay is 1 sec, State BDR, Priority 1
  Designated Router (ID) 2.2.2.2, Interface address 172.20.0.2
  Backup Designated Router (ID) 192.168.61.1, Interface address 172.20.0.1
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    Hello due in 00:00:07
  Index 1/1, flood queue length 0
  Next 0x0(0)/0x0(0)
  Last flood scan length is 1, maximum is 1
  Last flood scan time is 0 msec, maximum is 0 msec
  Neighbor Count is 1, Adjacent neighbor count is 1
    Adjacent with neighbor 2.2.2.2  (Designated Router)
  Suppress hello for 0 neighbor(s)
FastEthernet1/0 is up, line protocol is up
  Internet address is 192.168.61.1/24, Area 0
  Process ID 1, Router ID 192.168.61.1, Network Type BROADCAST, Cost: 1
  Transmit Delay is 1 sec, State BDR, Priority 1
  Designated Router (ID) 5.5.5.5, Interface address 192.168.61.2
  Backup Designated Router (ID) 192.168.61.1, Interface address 192.168.61.1
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    Hello due in 00:00:09
  Index 2/2, flood queue length 0
  Next 0x0(0)/0x0(0)
  Last flood scan length is 1, maximum is 1
  Last flood scan time is 0 msec, maximum is 0 msec
  Neighbor Count is 1, Adjacent neighbor count is 1
    Adjacent with neighbor 5.5.5.5  (Designated Router)
  Suppress hello for 0 neighbor(s)
FastEthernet0/0.300 is up, line protocol is up
  Internet address is 192.168.100.1/24, Area 0
  Process ID 1, Router ID 192.168.61.1, Network Type BROADCAST, Cost: 1
  Transmit Delay is 1 sec, State DR, Priority 1
  Designated Router (ID) 192.168.61.1, Interface address 192.168.100.1
  No backup designated router on this network
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    Hello due in 00:00:03
  Index 3/3, flood queue length 0
  Next 0x0(0)/0x0(0)
  Last flood scan length is 1, maximum is 1
  Last flood scan time is 0 msec, maximum is 0 msec
  Neighbor Count is 0, Adjacent neighbor count is 0
  Suppress hello for 0 neighbor(s)
FastEthernet0/0.320 is up, line protocol is up
  Internet address is 10.0.0.1/8, Area 0
  Process ID 1, Router ID 192.168.61.1, Network Type BROADCAST, Cost: 1
  Transmit Delay is 1 sec, State DR, Priority 1
  Designated Router (ID) 192.168.61.1, Interface address 10.0.0.1
  No backup designated router on this network
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    Hello due in 00:00:04
  Index 4/4, flood queue length 0
  Next 0x0(0)/0x0(0)
  Last flood scan length is 1, maximum is 1
  Last flood scan time is 0 msec, maximum is 0 msec
  Neighbor Count is 0, Adjacent neighbor count is 0
  Suppress hello for 0 neighbor(s)
FastEthernet0/0.330 is up, line protocol is up
  Internet address is 192.168.200.1/24, Area 0
  Process ID 1, Router ID 192.168.61.1, Network Type BROADCAST, Cost: 1
  Transmit Delay is 1 sec, State DR, Priority 1
  Designated Router (ID) 192.168.61.1, Interface address 192.168.200.1
  No backup designated router on this network
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    Hello due in 00:00:09
  Index 5/5, flood queue length 0
  Next 0x0(0)/0x0(0)
  Last flood scan length is 1, maximum is 1
  Last flood scan time is 0 msec, maximum is 0 msec
  Neighbor Count is 0, Adjacent neighbor count is 0
  Suppress hello for 0 neighbor(s)
Router#
Router#
Router#sh run
Building configuration...

Current configuration : 1096 bytes
!
version 12.2
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname Router
!
!
ip cef
no ipv6 cef
!
!
interface FastEthernet0/0
 no ip address
 duplex auto
 speed auto
!
interface FastEthernet0/0.300
 encapsulation dot1Q 300
 ip address 192.168.100.1 255.255.255.0
!
interface FastEthernet0/0.320
 encapsulation dot1Q 320
 ip address 10.0.0.1 255.0.0.0
!
interface FastEthernet0/0.330
 encapsulation dot1Q 330
 ip address 192.168.200.1 255.255.255.0
!
interface FastEthernet0/1
 ip address 172.20.0.1 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet1/0
 ip address 192.168.61.1 255.255.255.0
 duplex auto
 speed auto
!
router ospf 1
 log-adjacency-changes
 network 172.20.0.0 0.0.0.255 area 0
 network 192.168.61.0 0.0.0.255 area 0
 network 192.168.100.0 0.0.0.255 area 0
 network 10.0.0.0 0.255.255.255 area 0
 network 192.168.200.0 0.0.0.255 area 0
!
ip classless
!
ip flow-export version 9
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
end

Router#
Router#wr
Building configuration...
[OK]
Router#