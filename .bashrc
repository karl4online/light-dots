# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

#######################################################
# Options
#######################################################
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

#######################################################
# Keybindings
#######################################################
set -o vi # vim
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
bind -m vi-command '"\e\l": clear-screen' # Alt-l
bind -m vi-insert '"\e\l": clear-screen'
bind -m vi-insert '"\e\z": "zi\n"'
bind -m vi-command 'Control-r: fzf-history-widget'
bind -m vi-insert 'Control-r: fzf-history-widget'

#######################################################
# History Options
#######################################################

# Expand the history size
export HISTFILESIZE=100000
export HISTSIZE=99999

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace
export HISTIGNORE="a:aa:c:cd:e:exit:f:ff:h:history:l:ll:ls:la:n:N:pwd:v:y:Y:z:zz"

alias a='ls --color=auto --group-directories-first'
alias aa='ls -lA --color=auto --group-directories-first'
alias l='ls --color=auto --group-directories-first'
alias ll='ls -lA --color=auto --group-directories-first'
alias ls='ls --color=auto --group-directories-first'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if [ -f /usr/share/bash-completion/bash_completion ]; then
. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

source /usr/share/doc/fzf/examples/key-bindings.bash
