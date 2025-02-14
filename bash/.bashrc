#
# ~/.bashrc
#

eval "$(starship init bash)"
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
