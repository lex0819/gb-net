Router>en
Router#sh run
Building configuration...

Current configuration : 1135 bytes
!
version 15.4
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
spanning-tree mode pvst
!
!
!
!
!
!
interface Tunnel333
 ip address 172.16.0.1 255.255.255.0
 mtu 1476
 tunnel source GigabitEthernet0/0/1
 tunnel destination 7.7.7.1
!
!
interface GigabitEthernet0/0/0
 ip address 10.1.1.1 255.255.255.0
 ip nat inside
 duplex auto
 speed auto
!
interface GigabitEthernet0/0/1
 ip address 5.5.5.1 255.255.255.0
 ip nat outside
 duplex auto
 speed auto
!
interface GigabitEthernet0/0/2
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Vlan1
 no ip address
 shutdown
!
router ospf 1
 router-id 0.0.0.1
 log-adjacency-changes
 network 5.5.5.0 0.0.0.255 area 0
!
ip nat inside source list NET_10.1.1.0/24 interface GigabitEthernet0/0/1 overload
ip classless
ip route 192.168.145.0 255.255.255.0 172.16.0.2 
!
ip flow-export version 9
!
!
ip access-list standard NET_10.1.1.0/24
 permit 10.1.1.0 0.0.0.255
!
no cdp run
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
Codes: L - local, C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2, E - EGP
       i - IS-IS, L1 - IS-IS level-1, L2 - IS-IS level-2, ia - IS-IS inter area
       * - candidate default, U - per-user static route, o - ODR
       P - periodic downloaded static route

Gateway of last resort is not set

     5.0.0.0/8 is variably subnetted, 2 subnets, 2 masks
C       5.5.5.0/24 is directly connected, GigabitEthernet0/0/1
L       5.5.5.1/32 is directly connected, GigabitEthernet0/0/1
     6.0.0.0/24 is subnetted, 1 subnets
O       6.6.6.0/24 [110/2] via 5.5.5.2, 00:55:06, GigabitEthernet0/0/1
     7.0.0.0/24 is subnetted, 1 subnets
O       7.7.7.0/24 [110/2] via 5.5.5.2, 00:55:06, GigabitEthernet0/0/1
     8.0.0.0/24 is subnetted, 1 subnets
O       8.8.8.0/24 [110/2] via 5.5.5.2, 00:55:06, GigabitEthernet0/0/1
     10.0.0.0/8 is variably subnetted, 2 subnets, 2 masks
C       10.1.1.0/24 is directly connected, GigabitEthernet0/0/0
L       10.1.1.1/32 is directly connected, GigabitEthernet0/0/0
     172.16.0.0/16 is variably subnetted, 2 subnets, 2 masks
C       172.16.0.0/24 is directly connected, Tunnel333
L       172.16.0.1/32 is directly connected, Tunnel333
S    192.168.145.0/24 [1/0] via 172.16.0.2

Router#
Router#
