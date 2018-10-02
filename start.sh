#!/bin/bash
SESSION=$USER

tmux -2 new-session -d -s $SESSION

# Setup a window for tailing log files
tmux split-window -v
tmux select-pane -t 0
tmux send-keys "ruby -run -e httpd -- -p 5000 ." C-m
tmux select-pane -t 1
tmux resize-pane -U 8
tmux send-keys "scss --watch css/style.scss:css/style.css css/style-tut2.scss:css/style-tut2.css css/common.scss:css/common.css" C-m
tmux split-window -v
tmux select-pane -t u
tmux send-keys "filewatcher 'tut1.slim' 'slimrb tut1.slim > tut1.html'" C-m

# Set default window
tmux select-window -t $SESSION:1

# Attach to session
tmux -2 attach-session -t $SESSION
