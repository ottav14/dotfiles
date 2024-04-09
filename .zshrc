PS1='%F{green}%n%f@%F{blue}%m %f%~%F{yellow} $ %f'

alias e='emacs -nw'
alias p='sudo pacman -S'
alias ps='pacman -Ss'
alias pd='sudo pacman -R'
alias pu='sudo pacman -Sy'
alias ls='ls --color'
alias lsa='ls --color -a'
alias tn='tmux new'
alias y='yay -S'
alias ys='yay'
alias b='sudo bluetoothctl'
alias xr='xrandr --output HDMI-2 --mode 1920x1080 --right-of eDP-1'
alias xo='xrandr --output HDMI-2 --off'
alias se='sudo systemctl enable'
alias ss='sudo systemctl start'
alias sr='sudo systemctl restart'
alias so='sudo systemctl stop'
alias pyu='sudo pacman -Syu'
alias nc='nmcli d wifi connect'
alias ns='nmcli d wifi rescan'
alias nl='nmcli d wifi list | cat'