HISTSIZE= HISTFILESIZE= # larger history

# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi

# TMUX
#if which tmux >/dev/null 2>&1; then
    # if no session is started, start a new session
    #test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    #while test -z ${TMUX}; do
        #tmux attach || break
    #done
#fi

# Set VI commands in bash
set -o vi

bind -m vi-command "v":

#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  #tmux a -t default || exec tmux new -s default && exit;
#fi

#[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}
#[ -z "$TMUX"  ] && exec tmux new-session && exit;

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto" # Color grep - highlight desired sequence.
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.

# Force tmux to use 256 colors
alias tmux='tmux -2'

LS_COLORS='rs=0:di=1;35:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

# PS1='\e[37;1m\u@\e[35m\W\e[0m\$ ' # this will change your prompt format

# Korean language support
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# modify rg to be used with fzf
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#source ~/.fzf.bash
source "/usr/share/fzf/completion.bash"
source "/usr/share/fzf/key-bindings.bash"
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

# Toggle easymotion-like jumps 'CTRL-SPACE'
# Toggle preview window with '?'
# Select all entries with 'ALT-A'
# Copy the selected entries to the copyq clipboard with 'CTRL-Y'
# Open the selected entries in vim with 'CTRL-E'
# Open the selected entries in vscode with 'CTRL-V'
export FZF_DEFAULT_OPTS="
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--bind 'ctrl-space:jump'
--bind '?:toggle-preview'
--bind 'alt-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | copyq copy -)'
--bind 'ctrl-e:execute(code {+})'
"

# enable fzf completion for zathura
complete -o bashdefault -o default -F _fzf_path_completion zathura

