Router>en
Router#sh ip nat ?
  statistics    Translation statistics
  translations  Translation entries
Router#sh ip nat tr
Router#sh ip nat translations 
Pro  Inside global     Inside local       Outside local      Outside global
tcp 6.6.6.1:1024       172.16.0.11:1025   8.8.8.1:80         8.8.8.1:80
tcp 6.6.6.1:1025       172.16.0.10:1025   8.8.8.1:80         8.8.8.1:80
tcp 6.6.6.1:1026       172.16.0.10:1026   8.8.8.1:443        8.8.8.1:443
tcp 6.6.6.1:1027       172.16.0.10:1027   8.8.8.1:443        8.8.8.1:443
tcp 6.6.6.1:1028       172.16.0.11:1026   8.8.8.1:443        8.8.8.1:443

Router#
Router#
Router#sh run
Building configuration...

Current configuration : 946 bytes
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
interface GigabitEthernet0/0/0
 ip address 172.16.0.1 255.255.0.0
 ip nat inside
 duplex auto
 speed auto
!
interface GigabitEthernet0/0/1
 ip address 6.6.6.1 255.255.255.0
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
 router-id 1.1.1.1
 log-adjacency-changes
 network 6.6.6.0 0.0.0.255 area 0
!
ip nat inside source list NET_172.16.0.0/16 interface GigabitEthernet0/0/1 overload
ip classless
!
ip flow-export version 9
!
!
ip access-list standard NET_172.16.0.0/16
 permit 172.16.0.0 0.0.255.255
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


Router#sh ip route
Codes: L - local, C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2, E - EGP
       i - IS-IS, L1 - IS-IS level-1, L2 - IS-IS level-2, ia - IS-IS inter area
       * - candidate default, U - per-user static route, o - ODR
       P - periodic downloaded static route

Gateway of last resort is not set

     5.0.0.0/24 is subnetted, 1 subnets
O       5.5.5.0/24 [110/2] via 6.6.6.2, 00:28:44, GigabitEthernet0/0/1
     6.0.0.0/8 is variably subnetted, 2 subnets, 2 masks
C       6.6.6.0/24 is directly connected, GigabitEthernet0/0/1
L       6.6.6.1/32 is directly connected, GigabitEthernet0/0/1
     7.0.0.0/24 is subnetted, 1 subnets
O       7.7.7.0/24 [110/2] via 6.6.6.2, 00:28:44, GigabitEthernet0/0/1
     8.0.0.0/24 is subnetted, 1 subnets
O       8.8.8.0/24 [110/2] via 6.6.6.2, 00:28:54, GigabitEthernet0/0/1
     172.16.0.0/16 is variably subnetted, 2 subnets, 2 masks
C       172.16.0.0/16 is directly connected, GigabitEthernet0/0/0
L       172.16.0.1/32 is directly connected, GigabitEthernet0/0/0

Router#
Router#sh ip ospf nei
Router#sh ip ospf neighbor 


Neighbor ID     Pri   State           Dead Time   Address         Interface
6.6.6.6           1   FULL/DR         00:00:35    6.6.6.2         GigabitEthernet0/0/1
Router#
Router#