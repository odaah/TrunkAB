#!/bin/bash                                                     
 # Collect the current user's ssh and enable passwords          
 echo -n "Enter the SSH password for $(whoami) "                
 read -s -e password                                            
 echo -ne '\n'                                                  
 echo -n "Enter the Enable password for $(whoami) "             
 read -s -e enable                                              
 echo -ne '\n'                                                  
# Feed the expect script a device list & the collected passwords

#execute the command on distro
for device in `cat ~/TrunkAB/distros.txt`; do                 
 ./cmd_po_exp.exp $device $password $enable ;                  
  

#Provides the list of port-channel 
 egrep -o "Po[0-9]{1,3}" results_po.log | sort -u > ea_po_distro.out ;

 ./cmd_po-vlan_exp.exp $device $password $enable ;                  

 sed -n '/^port-channel\|VLANs Allowed/p' results_vlantrunk.log > $device-vlantrunk.out ;
 cat $device-vlantrunk.out | tr -d '\r' | awk '{if ($1 ~ /port/) {printf "%s ",$0} else {print;}}' > $device-vtrunkline.out 
 
 rm -f $device-vlantrunk.out ;
 rm -f results_po.log ;
 rm -f ea_po_distro.out ;
 rm -f results_vlantrunk.log ;

  done
