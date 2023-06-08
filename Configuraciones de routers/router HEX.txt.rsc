# jun/02/2023 19:59:47 by RouterOS 6.48.6
# software id = PAP4-U282
#
# model = RB750Gr3
# serial number = HCY085HXFNR
/interface bridge
add admin-mac=18:FD:74:72:AD:BD auto-mac=no comment=defconf name=bridge
/interface list
add comment=defconf name=WAN
add comment=defconf name=LAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=hotspot
/ip pool
add name=dhcp ranges=192.168.66.10-192.168.66.254
/ip dhcp-server
add address-pool=dhcp interface=bridge name=defconf
/interface bridge port
add bridge=bridge comment=defconf interface=ether2
add bridge=bridge comment=defconf interface=ether3
add bridge=bridge comment=defconf interface=ether4
add bridge=bridge comment=defconf interface=ether5
/ip neighbor discovery-settings
set discover-interface-list=LAN
/interface list member
add comment=defconf interface=bridge list=LAN
add comment=defconf interface=ether1 list=WAN
/ip address
add address=192.168.70.1/24 comment=defconf interface=bridge network=\
    192.168.70.0
add address=192.168.204.79/24 interface=ether1 network=192.168.204.0
/ip dhcp-client
add comment=defconf interface=ether1
/ip dhcp-server network
add address=192.168.66.0/24 comment=defconf gateway=192.168.66.1 netmask=24
/ip dns
set allow-remote-requests=yes servers=8.8.8.8
/ip dns static
add address=192.168.70.1 comment=defconf name=router.lan
/ip firewall filter
add action=accept chain=input comment=\
    "defconf: accept established,related,untracked" connection-state=\
    established,related,untracked
add action=drop chain=input comment="defconf: drop invalid" connection-state=\
    invalid
add action=accept chain=input comment="defconf: accept ICMP" protocol=icmp
add action=accept chain=input comment=\
    "defconf: accept to local loopback (for CAPsMAN)" dst-address=127.0.0.1
add action=drop chain=input comment="defconf: drop all not coming from LAN" \
    in-interface-list=!LAN
add action=accept chain=forward comment="defconf: accept in ipsec policy" \
    ipsec-policy=in,ipsec
add action=accept chain=forward comment="defconf: accept out ipsec policy" \
    ipsec-policy=out,ipsec
add action=fasttrack-connection chain=forward comment="defconf: fasttrack" \
    connection-state=established,related
add action=accept chain=forward comment=\
    "defconf: accept established,related, untracked" connection-state=\
    established,related,untracked
add action=drop chain=forward comment="defconf: drop invalid" \
    connection-state=invalid
add action=drop chain=forward comment=\
    "defconf: drop all from WAN not DSTNATed" connection-nat-state=!dstnat \
    connection-state=new in-interface-list=WAN
/ip firewall nat
add action=masquerade chain=srcnat comment="defconf: masquerade" \
    ipsec-policy=out,none out-interface-list=WAN
/ip route
add distance=1 gateway=192.168.204.1
/system clock
set time-zone-name=Europe/Madrid
/system identity
set name="PowerWash Enterprice"
/tool mac-server
set allowed-interface-list=LAN
/tool mac-server mac-winbox
set allowed-interface-list=LAN
