#!/bin/bash

# Source the environment file
source env.mk

# Start a new tmux session
tmux new-session -d -s debug_session

# Split the tmux window into two horizontal panes
tmux split-window -h

# Run QEMU in the left pane
tmux send-keys -t debug_session:0.0 "qemu-aarch64 -L /usr/aarch64-linux-gnu -g 1234 ./$BINARY" C-m

# Wait for QEMU to initialize
sleep 1

# Run GDB in the right pane
tmux send-keys -t debug_session:0.1 "gdb-multiarch -nx -q --nh -ex 'set architecture aarch64' -ex 'file $BINARY' -ex 'target remote localhost:1234'" C-m

# Attach to the tmux session
tmux attach-session -t debug_session