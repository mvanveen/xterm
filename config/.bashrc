export LS_OPTS='--color=auto'
alias ls='ls ${LS_OPTS}'
alias less='less --RAW-CONTROL-CHARS'
PS1='\e[33;1m\u@\h: \e[31m\W\e[0m\$ '
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
