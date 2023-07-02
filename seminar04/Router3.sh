Router>en
Router#sh ip route
Codes: C - connected, S - static, I - IGRP, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2, E - EGP
       i - IS-IS, L1 - IS-IS level-1, L2 - IS-IS level-2, ia - IS-IS inter area
       * - candidate default, U - per-user static route, o - ODR
       P - periodic downloaded static route

Gateway of last resort is not set

O    10.0.0.0/8 [110/3] via 172.18.0.1, 00:51:11, FastEthernet0/1
                [110/3] via 192.168.16.1, 00:51:11, FastEthernet1/0
O    172.17.0.0/16 [110/2] via 192.168.6.2, 01:22:46, FastEthernet0/0
C    172.18.0.0/16 is directly connected, FastEthernet0/1
     172.20.0.0/24 is subnetted, 1 subnets
O       172.20.0.0 [110/2] via 172.18.0.1, 03:16:40, FastEthernet0/1
C    192.168.6.0/24 is directly connected, FastEthernet0/0
C    192.168.16.0/24 is directly connected, FastEthernet1/0
O    192.168.61.0/24 [110/2] via 192.168.16.1, 00:51:11, FastEthernet1/0
O    192.168.100.0/24 [110/3] via 172.18.0.1, 00:51:11, FastEthernet0/1
                      [110/3] via 192.168.16.1, 00:51:11, FastEthernet1/0
O    192.168.200.0/24 [110/3] via 172.18.0.1, 00:51:11, FastEthernet0/1
                      [110/3] via 192.168.16.1, 00:51:11, FastEthernet1/0

Router#
Router#sh ip ospf int

FastEthernet0/1 is up, line protocol is up
  Internet address is 172.18.0.2/16, Area 0
  Process ID 1, Router ID 3.3.3.3, Network Type BROADCAST, Cost: 1
  Transmit Delay is 1 sec, State DR, Priority 1
  Designated Router (ID) 3.3.3.3, Interface address 172.18.0.2
  Backup Designated Router (ID) 2.2.2.2, Interface address 172.18.0.1
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    Hello due in 00:00:01
  Index 1/1, flood queue length 0
  Next 0x0(0)/0x0(0)
  Last flood scan length is 1, maximum is 1
  Last flood scan time is 0 msec, maximum is 0 msec
  Neighbor Count is 1, Adjacent neighbor count is 1
    Adjacent with neighbor 2.2.2.2  (Backup Designated Router)
  Suppress hello for 0 neighbor(s)
FastEthernet0/0 is up, line protocol is up
  Internet address is 192.168.6.1/24, Area 0
  Process ID 1, Router ID 3.3.3.3, Network Type BROADCAST, Cost: 1
  Transmit Delay is 1 sec, State DR, Priority 1
  Designated Router (ID) 3.3.3.3, Interface address 192.168.6.1
  Backup Designated Router (ID) 4.4.4.4, Interface address 192.168.6.2
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    Hello due in 00:00:01
  Index 2/2, flood queue length 0
  Next 0x0(0)/0x0(0)
  Last flood scan length is 1, maximum is 1
  Last flood scan time is 0 msec, maximum is 0 msec
  Neighbor Count is 1, Adjacent neighbor count is 1
    Adjacent with neighbor 4.4.4.4  (Backup Designated Router)
  Suppress hello for 0 neighbor(s)
FastEthernet1/0 is up, line protocol is up
  Internet address is 192.168.16.2/24, Area 0
  Process ID 1, Router ID 3.3.3.3, Network Type BROADCAST, Cost: 1
  Transmit Delay is 1 sec, State BDR, Priority 1
  Designated Router (ID) 5.5.5.5, Interface address 192.168.16.1
  Backup Designated Router (ID) 3.3.3.3, Interface address 192.168.16.2
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    Hello due in 00:00:02
  Index 3/3, flood queue length 0
  Next 0x0(0)/0x0(0)
  Last flood scan length is 1, maximum is 1
  Last flood scan time is 0 msec, maximum is 0 msec
  Neighbor Count is 1, Adjacent neighbor count is 1
    Adjacent with neighbor 5.5.5.5  (Designated Router)
  Suppress hello for 0 neighbor(s)
Router#
Router#sh run
Building configuration...

Current configuration : 791 bytes
!
version 12.2
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname Router
!
!
!
!
!
!
!
!
no ip cef
no ipv6 cef
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
interface FastEthernet0/0
 ip address 192.168.6.1 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet0/1
 ip address 172.18.0.2 255.255.0.0
 duplex auto
 speed auto
!
interface FastEthernet1/0
 ip address 192.168.16.2 255.255.255.0
 duplex auto
 speed auto
!
router ospf 1
 router-id 3.3.3.3
 log-adjacency-changes
 network 192.168.6.0 0.0.0.255 area 0
 network 192.168.16.0 0.0.0.255 area 0
 network 172.18.0.0 0.0.255.255 area 0
!
ip classless
!
ip flow-export version 9
!
!
!
no cdp run
!
!
!
!
!
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
end


Router#
Router#wr
Building configuration...
[OK]
Router#
