#!/usr/bin/env zsh

function conf() {
  declare -A configs=(
    [hypr]="$XDG_CONFIG_HOME/hypr/hyprland.conf"
    [hyprlock]="$XDG_CONFIG_HOME/hypr/hyprlock.conf"
    [hypridle]="$XDG_CONFIG_HOME/hypr/hypridle.conf"
    [hyprpaper]="$XDG_CONFIG_HOME/hypr/hyprpaper.conf"
    [xdph]="$XDG_CONFIG_HOME/hypr/xdph.conf"
    [dunst]="$XDG_CONFIG_HOME/wallust/templates/dunstrc"
    [bottom]="$XDG_CONFIG_HOME/bottom/bottom.toml"
    [fastfetch]="$XDG_CONFIG_HOME/fastfetch/config.jsonc"
    [fuzzel]="$XDG_CONFIG_HOME/fuzzel/fuzzel.ini"
    [wleave]="$XDG_CONFIG_HOME/wleave/layout"
    [makepkg]="$XDG_CONFIG_HOME/pacman/makepkg.conf"
    [paru]="$XDG_CONFIG_HOME/paru/paru.conf"
    [foot]="$XDG_CONFIG_HOME/foot/foot.ini"
  )

  if [[ -n ${configs[$1]} ]]; then
    $EDITOR "${configs[$1]}"
  else
    echo "Configuration for '$1' not found."
  fi
}

function paste() {
  local file=${1:-/dev/stdin}
	local link=$(curl -s --data-binary @"$file" https://paste.rs)
	echo $link
	wl-copy $link
}

# See: https://codeberg.org/dnkl/foot/wiki#user-content-spawning-new-terminal-instances-in-the-current-working-directory
function osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}
function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}
