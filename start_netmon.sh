#! /bin/bash
# now=$(date -d "%Y%m%d")
[ -f "htb_netmon.ba9" ] && rm htb_netmon.ba9
[ -f "htb_netmon.ba8" ] && mv htb_netmon.ba8 htb_netmon.ba9
[ -f "htb_netmon.ba7" ] && mv htb_netmon.ba7 htb_netmon.ba8
[ -f "htb_netmon.ba6" ] && mv htb_netmon.ba6 htb_netmon.ba7
[ -f "htb_netmon.ba5" ] && mv htb_netmon.ba5 htb_netmon.ba6
[ -f "htb_netmon.ba4" ] && mv htb_netmon.ba4 htb_netmon.ba5
[ -f "htb_netmon.ba3" ] && mv htb_netmon.ba3 htb_netmon.ba4
[ -f "htb_netmon.ba2" ] && mv htb_netmon.ba2 htb_netmon.ba3
[ -f "htb_netmon.ba1" ] && mv htb_netmon.ba1 htb_netmon.ba2
[ -f "htb_netmon.log" ] && mv htb_netmon.log htb_netmon.ba1
sudo tcpdump -n -i tun0 -w htb_netmon.log -s0 -vv
