Router>en
Router#sh run
Building configuration...

Current configuration : 944 bytes
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
spanning-tree mode pvst
!
!
!
!
!
!
interface GigabitEthernet0/0/0
 ip address 11.22.33.1 255.255.255.128
 ip nat outside
 duplex auto
 speed auto
!
interface GigabitEthernet0/0/1
 ip address 192.168.0.1 255.255.255.0
 ip nat inside
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
 router-id 1.1.1.3
 log-adjacency-changes
 network 11.22.33.0 0.0.0.127 area 0
!
ip nat inside source list net192 interface GigabitEthernet0/0/0 overload
ip classless
!
ip flow-export version 9
!
!
ip access-list standard net192
 permit 192.168.0.0 0.0.0.255
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
