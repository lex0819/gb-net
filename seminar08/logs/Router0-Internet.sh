Router>en
Router#sh run
Building configuration...

Current configuration : 915 bytes
!
version 15.1
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
license udi pid CISCO2911/K9 sn FTX1524511X-
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
interface GigabitEthernet0/0
 ip address 11.22.34.2 255.255.255.0
 duplex auto
 speed auto
!
interface GigabitEthernet0/1
 ip address 11.22.33.130 255.255.255.128
 duplex auto
 speed auto
!
interface GigabitEthernet0/2
 ip address 11.22.33.2 255.255.255.128
 duplex auto
 speed auto
!
interface Vlan1
 no ip address
 shutdown
!
router ospf 1
 router-id 1.1.1.0
 log-adjacency-changes
 network 11.22.33.0 0.0.0.127 area 0
 network 11.22.34.0 0.0.0.255 area 0
 network 11.22.33.128 0.0.0.127 area 0
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