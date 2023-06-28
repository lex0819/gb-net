Router>en
Router#sh run
Building configuration...

Current configuration : 997 bytes
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
ip cef
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
interface Loopback0
 ip address 172.16.0.1 255.255.0.0
!
interface Loopback1
 ip address 192.168.236.1 255.255.255.0
!
interface FastEthernet0/0
 ip address 192.168.4.2 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
router rip
!
ip classless
ip route 192.168.0.0 255.255.255.0 192.168.4.1 
ip route 10.0.0.0 255.0.0.0 192.168.4.1 
ip route 172.18.0.0 255.255.0.0 192.168.4.1 
ip route 172.17.0.0 255.255.0.0 192.168.4.1 
ip route 192.168.6.0 255.255.255.0 192.168.4.1 
ip route 172.20.0.0 255.255.0.0 192.168.4.1 
ip route 172.31.0.0 255.255.0.0 192.168.4.1 
ip route 192.168.46.0 255.255.255.0 192.168.4.1 
!
ip flow-export version 9
!
!
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
Router#sh ip route
Codes: C - connected, S - static, I - IGRP, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2, E - EGP
       i - IS-IS, L1 - IS-IS level-1, L2 - IS-IS level-2, ia - IS-IS inter area
       * - candidate default, U - per-user static route, o - ODR
       P - periodic downloaded static route

Gateway of last resort is not set

S    10.0.0.0/8 [1/0] via 192.168.4.1
C    172.16.0.0/16 is directly connected, Loopback0
S    172.17.0.0/16 [1/0] via 192.168.4.1
S    172.18.0.0/16 [1/0] via 192.168.4.1
S    172.20.0.0/16 [1/0] via 192.168.4.1
S    172.31.0.0/16 [1/0] via 192.168.4.1
S    192.168.0.0/24 [1/0] via 192.168.4.1
C    192.168.4.0/24 is directly connected, FastEthernet0/0
S    192.168.6.0/24 [1/0] via 192.168.4.1
S    192.168.46.0/24 [1/0] via 192.168.4.1
C    192.168.236.0/24 is directly connected, Loopback1

Router#
Router#wr
Router#write 
Building configuration...
[OK]
Router#
