#!/bin/sh
# Click: open the project list. Pick a project to start it, or stop the running one.

TT="${TT_BIN:-$HOME/.cargo/bin/tt}"
NAME="${NAME:-tt}"

quote() { printf "'%s'" "$(printf %s "$1" | sed "s/'/'\\\\''/g")"; }

CLOSE="sketchybar --set $NAME popup.drawing=off --trigger tt_update"

STATUS="$("$TT" status)"
if [ "$STATUS" = "idle" ]; then
  sketchybar --set "$NAME" label="idle"
else
  sketchybar --set "$NAME" label="$STATUS"
fi

case "$SENDER" in
  mouse.clicked)
    sketchybar --remove '/tt\.p\..*/' >/dev/null 2>&1
    CURRENT=""
    if [ "$STATUS" != "idle" ]; then
      CURRENT="${STATUS% *}"
      sketchybar --add item tt.p.stop popup."$NAME" \
                 --set tt.p.stop icon="■" icon.color=0xffac3976 label="Stop" \
                       icon.padding_left=10 label.padding_right=10 \
                       click_script="$(quote "$TT") stop >/dev/null; $CLOSE"
    fi
    i=0
    "$TT" projects -n 8 | while IFS= read -r p; do
      mark=" "
      [ "$p" = "$CURRENT" ] && mark="●"
      sketchybar --add item "tt.p.$i" popup."$NAME" \
                 --set "tt.p.$i" icon="$mark" label="$p" \
                       icon.padding_left=10 label.padding_right=10 \
                       click_script="$(quote "$TT") start $(quote "$p") >/dev/null; $CLOSE"
      i=$((i + 1))
    done
    sketchybar --set "$NAME" popup.drawing=toggle
    ;;
  mouse.exited.global)
    sketchybar --set "$NAME" popup.drawing=off
    ;;
  system_will_sleep)
    "$TT" stop >/dev/null 2>&1
    ;;
esac
