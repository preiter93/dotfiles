#!/bin/bash
#
sketchybar --add item clock right \
           --set clock \
                update_freq=10 \
                icon=  \
                icon.font="JetBrainsMono Nerd Font:Regular:13.0" \
                script="$PLUGIN_DIR/clock.sh" \
