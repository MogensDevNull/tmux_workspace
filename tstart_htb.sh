#!/bin/sh
session="htb"

# set up tmux
tmux start-server

# create a new tmux session named htb-main
tmux new-session -d -s $session -n htb-main

# Configure htb-main window
tmux selectp -t 0
tmux splitw -h -p 50
tmux selectp -t 0
tmux splitw -v -p 50

tmux selectp -t 2
tmux splitw -v -p 75
tmux splitw -v -p 75
tmux splitw -v -p 75
tmux selectp -t 5
tmux send-keys "htop" C-m
tmux selectp -t 0

# create a new window called openvpn
tmux new-window -t $session:1 -n openvpn
tmux select-window -t $session:1
tmux splitw -h -p 50
tmux selectp -t 1
tmux send-keys "cd ~/logs;clear" C-m
tmux selectp -t 0
tmux send-keys "openvpn my.ovpn" C-m
tmux selectp -t 1
tmux splitw -v
tmux selectp -t 2
tmux send-keys "sleep 3;ifconfig" C-m
tmux selectp -t 1
tmux send-keys "sleep 3;~/logs/start_netmon.sh" C-m

# return to main vim window
tmux select-window -t $session:0

# Finished setup, attach to the tmux session!
tmux attach-session -t $session
