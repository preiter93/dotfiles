#!/bin/bash

sketchybar --add item battery right \
           --set battery \
                 update_freq=120 \
                 script="$PLUGIN_DIR/battery.sh" \
                 icon.color=0xffa6e3a1 \
                 icon.padding_left=8 \
                 icon.padding_right=4 \
                 label.padding_left=4 \
                 label.padding_right=8 \
                 background.drawing=off \
           --subscribe battery system_woke power_source_change
