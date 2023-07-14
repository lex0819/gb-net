Router(config)#
Router(config)#do sh run
Building configuration...

Current configuration : 958 bytes
!
version 16.6.4
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
 ip address 6.6.6.1 255.255.255.252
 ip nat outside
 duplex auto
 speed auto
 shutdown
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
 network 6.6.6.0 0.0.0.3 area 0
!
ip nat inside source list NET_172.16.0.0/16 interface GigabitEthernet0/0/0 overload
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


Router(config)#