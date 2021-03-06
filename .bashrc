stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi

# Automatically start tmux session
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [[ "VSCODE" != "yes" ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

export GPG_TTY=$(tty)

# Set VI commands in bash
set -o vi

# Some aliases
#alias SS="sudo systemctl"
# alias v="vim"
# alias sv="sudo vim"
alias r="ranger"
alias sr="sudo ranger"
alias ska="sudo killall"
alias g="git"
#alias trem="transmission-remote"
alias mkd="mkdir -pv"

# Start the default Windows Program for the given file
alias opf="cmd.exe /C start"

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto" # Color grep - highlight desired sequence.
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.

# Used to allow VIM to use the system clipboard, through xlaunch windows app
export DISPLAY=localhost:0.0

# TeX
#alias Txa="cp ~/Documents/LaTeX/article.tex"
#alias Txs="cp ~/Documents/LaTeX/beamer.tex"
#alias Txh="cp ~/Documents/LaTeX/handout.tex"

#source ~/.shortcuts


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
