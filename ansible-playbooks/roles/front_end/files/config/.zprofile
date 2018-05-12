#
# ~/.zprofile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc

typeset -U path
path=(~/bin $path[@])

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx -- -keeptty > ~/.xorg.log 2>&1
fi
