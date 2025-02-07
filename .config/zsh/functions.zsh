#!/usr/bin/env zsh

function conf() {
  case $1 in
    hypr)     $EDITOR "$XDG_CONFIG_HOME/hypr/hyprland.conf" ;;
    hyprlock) $EDITOR "$XDG_CONFIG_HOME/hypr/hyprlock.conf" ;;
    hypridle) $EDITOR "$XDG_CONFIG_HOME/hypr/hypridle.conf" ;;
    hyprpaper) $EDITOR "$XDG_CONFIG_HOME/hypr/hyprpaper.conf" ;;
    xdph) $EDITOR "$XDG_CONFIG_HOME/hypr/xdph.conf" ;;
    dunst)    $EDITOR "$XDG_CONFIG_HOME/wallust/templates/dunstrc" ;;
    bottom) $EDITOR "$XDG_CONFIG_HOME/bottom/bottom.toml" ;;
    fastfetch) $EDITOR "$XDG_CONFIG_HOME/fastfetch/config.jsonc" ;;
    fuzzel) $EDITOR "$XDG_CONFIG_HOME/fuzzel/fuzzel.ini" ;;
    wleave) $EDITOR "$XDG_CONFIG_HOME/wleave/layout" ;;
    makepkg) $EDITOR "$XDG_CONFIG_HOME/pacman/makepkg.conf" ;;
    paru) $EDITOR "$XDG_CONFIG_HOME/paru/paru.conf" ;;
    foot)    $EDITOR "$XDG_CONFIG_HOME/foot/foot.ini" ;;
  esac
}

function paste() {
  local file=${1:-/dev/stdin}
	local link=$(curl -s --data-binary @"$file" https://paste.rs)
	echo $link
	wl-copy $link
}


function osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}
function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}
