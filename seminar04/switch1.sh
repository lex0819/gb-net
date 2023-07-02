Switch>
Switch>en
Switch#sh vlan

VLAN Name                             Status    Ports
---- -------------------------------- --------- -------------------------------
1    default                          active    Fa0/6, Fa0/7, Fa0/8, Fa0/9
                                                Fa0/10, Fa0/11, Fa0/12, Fa0/13
                                                Fa0/14, Fa0/15, Fa0/16, Fa0/17
                                                Fa0/18, Fa0/19, Fa0/20, Fa0/21
                                                Fa0/24
300  Admins                           active    Fa0/4, Fa0/5
320  DevOps                           active    Fa0/22, Fa0/23
330  Test                             active    Fa0/2, Fa0/3
1002 fddi-default                     active    
1003 token-ring-default               active    
1004 fddinet-default                  active    
1005 trnet-default                    active    

VLAN Type  SAID       MTU   Parent RingNo BridgeNo Stp  BrdgMode Trans1 Trans2
---- ----- ---------- ----- ------ ------ -------- ---- -------- ------ ------
1    enet  100001     1500  -      -      -        -    -        0      0
300  enet  100300     1500  -      -      -        -    -        0      0
320  enet  100320     1500  -      -      -        -    -        0      0
330  enet  100330     1500  -      -      -        -    -        0      0
1002 fddi  101002     1500  -      -      -        -    -        0      0   
1003 tr    101003     1500  -      -      -        -    -        0      0   
1004 fdnet 101004     1500  -      -      -        ieee -        0      0   
1005 trnet 101005     1500  -      -      -        ibm  -        0      0   

VLAN Type  SAID       MTU   Parent RingNo BridgeNo Stp  BrdgMode Trans1 Trans2
---- ----- ---------- ----- ------ ------ -------- ---- -------- ------ ------

Remote SPAN VLANs
------------------------------------------------------------------------------

Primary Secondary Type              Ports
------- --------- ----------------- ------------------------------------------
Switch#
Switch#sh mac-address-table
          Mac Address Table
-------------------------------------------

Vlan    Mac Address       Type        Ports
----    -----------       --------    -----

   1    00e0.b0bd.e001    DYNAMIC     Fa0/1
 300    00d0.ba7d.2115    DYNAMIC     Fa0/5
 300    00e0.a370.0ba5    DYNAMIC     Fa0/4
 300    00e0.b0bd.e001    DYNAMIC     Fa0/1
 320    00e0.b0bd.e001    DYNAMIC     Fa0/1
 330    00e0.b0bd.e001    DYNAMIC     Fa0/1
Switch#
Switch#
Switch#wr
Building configuration...
[OK]
Switch#