#
# ~/.zprofile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc

typeset -U path
path=(~/bin $path[@])

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
