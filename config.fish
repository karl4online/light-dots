#!/usr/env fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

### ADDING TO THE PATH
# Without the first line, your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

### EXPORT ###
set fish_greeting # Supresses fish's intro message
set -x EDITOR vim # Use Neovim in terminal
set -x VISUAL vim # Use Neovim in GUI mode
set -x SUDO_EDITOR /usr/bin/vim # $SUDU_EDITOR

# follow XDG base dir specification
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_STATE_HOME "$HOME/.local/state"

# FZF
set FZF_CTRL_T_COMMAND 'fd --type f --type l'

# FZF Options
set FZF_CTRL_T_OPTS "--preview='cat --color=always {}'"
set FZF_ALT_C_OPTS "--preview='lsd -Ah --group-dirs=first --color=always {}'"

set -Ux FZF_DEFAULT_OPTS "
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

### FUNCTIONS ###
function fish_user_key_bindings
    fish_vi_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
        bind -M $mode \cb backward-char
        bind -M $mode \ef forward-word
        bind -M $mode \eb backward-word
        bind -M $mode \ce end-of-line
        bind -M $mode \ca beginning-of-line
        bind -M $mode \ez 'zi && commandline --function repaint'
        bind -M $mode \el 'clear; commandline -f repaint; echo bind OK'
    end
end

# Function for bat instead of cat
function cat
    if test -n (which bat)
        bat $argv
    else
        command cat $argv
    end
end

if test -n (which lsd)
    alias a='lsd -A  --group-dirs=first --no-symlink'
    alias aa='lsd -Alv --group-dirs=first --no-symlink --permission octal --size short --truncate-owner-after 6 --date +"%d/%m %H:%M"'
    alias l='a'
    alias ll='aa'
    alias lt='lsd --tree --depth=3 --no-symlink'
    alias ls='lsd'
else
    alias a='ls -A --color=auto --group-directories-first'
    alias aa='ls -Al --color=auto --group-directories-first'
    alias l='a'
    alias ll='aa'
    alias ls='ls --color=auto'
end

alias v='vim'

# Change directory aliases
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'

## Colorize the grep command output for ease of use (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

fzf --fish | source
