# Colors
color0="#06172B"   # Navy
color1="#C87559"   # Terracotta
color2="#8FB8A5"   # Sage
color3="#E8B66F"   # Amber
color4="#537FA8"   # Slate blue
color5="#9B89B8"   # Lavender
color6="#72BDB8"   # Teal
color7="#D9DDD9"   # Light gray

color8="#354657"   # Dark slate
color9="#EF9278"   # Coral
color10="#B4D3BF"  # Light sage
color11="#F5D092"  # Light amber
color12="#7BA6D4"  # Light blue
color13="#C0A9D9"  # Light lavender
color14="#A0D9CD"  # Light teal
color15="#FFF1D9"  # Cream

# Git branch
autoload -Uz vcs_info
precmd() { vcs_info }
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '%b'

git_prompt() {
  if [[ -n "$vcs_info_msg_0_" ]]; then
    print -n "%F{${color2}}%K{${color1}}%F{${color0}} 󰊤 ${vcs_info_msg_0_} %F{${color1}}%K{${color0}}"
  else
    print -n "%F{${color2}}"
  fi
}

# Prompt
PROMPT='%K{${color2}}%F{${color0}} 󰉋 %~ %k$(git_prompt)%f
%F{${color3}}❯%f '
