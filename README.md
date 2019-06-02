# tmux_workspace
This starts up a multi-pane, 2-window tmux session to have a consistent workspace. 
I use this for development work, penetration testing, and practicing hackthebox.eu lab environment.
The nice thing about scripting a tmux workspace is that you can script automation tasks when tmux starts up.

The `tstart_htb.sh` script will setup the tmux workspace and then perform the following:
  - Start htop to monitor resource utilization for the linux host.
  - Connect to a VPN using your own ovpn file (this is not something included here).
  
The `start_netmon.sh` script is called from within the `tstart_htb.sh` script and will perform the following:
  - Start a packet capture using tcpdump on the VPN interface (-i tun0)
  - Keep a rolling backup of the most recent 10 pcap logs

# Setup:
  Make a logs directory that will be used by the `start_netmon.sh` script to write tcpdump output (the script defaults to ~/logs).
    - mkdir ~/logs
  
  Install htop to show resource usage for CPU, memory, etc.
    - Debian/Ubuntu: sudo apt install htop
    - CentOS/RedHat: sudo yum install htop
  
  Update the `tstart_htb.sh` script to reflect the correct path and name of your ovpn file so that it starts with tmux.
    - tmux send-keys "openvpn my.ovpn" C-m
  
  Verify tcpdump is installed.
    - `tcpdump --version`
    
# Run:
  Move the script `start_netmon.sh` to your logs directory.
    - mv start_netmon.sh ~/logs/
  
  Move the script `tstart_htb.sh` to a directory in your path (/usr/bin/ as an example).
    - sudo mv tstart_htb.sh /usr/bin/
    
  Set the execution rights on script `tstart_htb.sh`.
    - sudo chmod +x /usr/bin/tstart_htb.sh
    
  If you followed the above steps then just type in `tstart_htb.sh` to run.
    - If you didn't copy it to a directory in your path then change directory to where you placed it and run it via: `./tstart_htb.sh`
