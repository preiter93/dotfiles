#!/bin/bash

# Adding Mission Control Space Indicators
SPACE_SIDS=(1 2 3 4 5)

for sid in "${SPACE_SIDS[@]}"
do
  sketchybar --add space space.$sid left                                  \
             --set space.$sid space=$sid                                  \
                            icon=$sid                                     \
                            foreground.color=0xffffffff                   \
                            background.color=0x40BB9AF7                   \
                            background.corner_radius=8                    \
                            background.height=25                          \
                            icon.padding_left=7                           \
                            icon.padding_right=8                          \
                            label.padding_right=2                         \
                            label.y_offset=-1                             \
                            label.drawing=off                             \
                            script="$PLUGIN_DIR/space.sh"
done
