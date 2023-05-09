## Sites

```
+-------------+ +-------------+  +-------------+ +--------------+  +-------------+ +-------------+
| spoke_vnet_a| | spoke_vnet_b|  |    spoke11  | |    spoke12   |  |   spoke21   | |   spoke22   |
|10.10.4.0/24 | |10.10.5.0/24 |  |10.10.1.0/24 | |10.200.2.0/24 |  |10.100.5.0/24| |10.100.6.0/24|
+-------------+ +-------------+  +-------------+ +--------------+  +-------------+ +-------------+
        +---------------+                  +---------------+                +-----------------+
        |   vela-vnet1  |                  |   vela-tgw1   |                |    vela-tgw2    |
        | 10.101.4.0/22 |                  | 10.100.0.0/22 |                | 10.100.4.0.0/24 |
        +---------------+                  +---------------+                +-----------------+
                                                        | direct connect vif 
                                                        | 
                                        + - - - - - - - | - - - - - - - - - - - - - +
                                          on-prem lab   |     10.200.0.0/22
                        { Internet }    |  +------------+------------------------+  |
                                                |                    | 
                                        | +-------------+      +-------------+      |
                                          |vela-vsphere1|      |vela-vsphere2|
                                        | |             |      |10.102.0.0/24       |
                                          +-------------+      +-------------+
                                        |                            |              |
                                                     vela-inside +-------+ 
                                        + - - - - - - - - - - - - - - - - - - - - - +

```

Sites:

- AWS TGW Site 1 with standard vif to on-prem lab
- AWS TGW Site 2 (standard vif not yet added)
- Azure Hub Site 1, spoke_vnet_b disconnected
- On-Prem lab secure mesh site vsphere1 (single interface)
- On-Prem lab secure mesh site vsphere2 (inside with dhcp services)
