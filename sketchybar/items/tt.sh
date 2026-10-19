sketchybar --add event tt_update \
           --add item tt right \
           --set tt icon="" \
                    update_freq=30 \
                    script="$PLUGIN_DIR/tt.sh" \
                    popup.align=right \
                    popup.background.color=0xf01e1e2e \
                    popup.background.corner_radius=8 \
                    popup.background.border_width=1 \
                    popup.background.border_color=0xff45475a \
                    icon.font="JetBrainsMono Nerd Font:Regular:15.0" \
           --subscribe tt mouse.clicked mouse.exited.global tt_update
