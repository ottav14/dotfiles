# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$PATH:/home/dom/scripts/:/home/dom/.local/bin:/home/dom/patches/cool-retro-term:/home/dom/bin
export MANPAGER="less -sR"
export INFO_BROWSER=pinfo

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

alias e='emacs -nw'
alias v='nvim'
alias p='sudo pacman -S'
alias ps='pacman -Ss'
alias pd='sudo pacman -R'
alias pu='sudo pacman -Sy'
alias ls='ls --color'
alias lsa='ls --color -A'
alias tn='tmux new'
alias ta='tmux a'
alias tk='pkill tmux'
alias y='yay -S'
alias ys='yay'
alias yd='yay -R'
alias yq='yay -Q'
alias f='cd "$(find /home/dom/projects -type d | fzf)" && tmux'
alias b='bluetui'
alias dcb='docker compose up --build'
alias xr='xrandr --output HDMI-2 --mode 1920x1080 --right-of eDP-1'
alias xo='xrandr --output HDMI-2 --off'
alias se='sudo systemctl enable'
alias sd='sudo systemctl disable'
alias ss='sudo systemctl start'
alias sr='sudo systemctl restart'
alias so='sudo systemctl stop'
alias pyu='sudo pacman -Syu'
alias nc='nmcli d wifi connect'
alias ns='nmcli d wifi rescan'
alias nl='nmcli d wifi list | cat'
alias shutdown='sudo shutdown -P now'
alias pak='pulseaudio -k'
alias pas='pulseaudio --start'
alias smi='sudo make install'
alias hr='hyprctl reload'
alias pipes='pipes.sh'
alias ac='sudo arduino-cli compile --fqbn arduino:avr:mega'
alias au='sudo arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:mega'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
