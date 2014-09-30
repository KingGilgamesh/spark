#! /bin/bash
#################################################################################
#     File Name           :     monitor.sh
#     Created By          :     xd
#     Creation Date       :     [2014-09-29 08:37]
#     Last Modified       :     [2014-09-29 10:08]
#     Description         :     tmux synchronize-panes 
#################################################################################

USER="xiaodi"
HOSTS="brick1 brick2 brick3 brick4 brick5 brick6"

tmux new-window
for host in $HOSTS
do
    tmux splitw "ssh $USER@$host"
    tmux select-layout tiled
done
tmux select-pane -t :.+;
tmux kill-pane
tmux select-layout tiled
tmux set-window-option synchronize-panes on

