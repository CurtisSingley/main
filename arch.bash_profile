#
# ~/.bash_profile
#

# set main monitor brightness to 40%
xrandr --output eDP-1 --brightness 0.4 

[[ -f ~/.bashrc ]] && . ~/.bashrc

# add fzf to PATH
if [[ -z $TMUX ]]; then
	  #export PATH=$PATH:/foo
		export PATH=$PATH:/usr/share/fzf
fi

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
