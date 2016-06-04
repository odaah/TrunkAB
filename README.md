# TrunkAB

The following script is useful in making sure that the A & B side distro or aggr switch has similar VLANs trunked to the ToR switches. 

distros.txt:
This file contains the list of switches/routers that needs to be checked. 

trunkab.sh:
This is the main bash script that will call the other expect scripts.

cmd_po_exp.exp:
Expect script that identifies the port-channels in the switches. 

cmd_po-vlan_exp.exp:
Expect script that identifies the vlans trunked through the port-channels identifies earlier. 

