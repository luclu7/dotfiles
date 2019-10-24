set -x GTK_THEME Arc-Dark
set -x TERM xterm
set -x VISUAL vim
set -x EDITOR vim
set -x GO111MODULE on
set -e VTE_VERSION
set -gx PATH $PATH /home/luclu7/bins /home/luclu7/go/bin /home/luclu7/.local/bin
set -x GOPATH /home/luclu7/go

# abbreviations
abbr l 'ls -lash'
abbr i 'sxiv'
abbr d 'sudo docker'
abbr nss 'systemctl'
abbr s 'sudo systemctl'
abbr ca 'curl -vvI -k'
abbr c 'cd'

alias docker="sudo docker"
alias b="buffalo"
# nix
eval (~/bins/nix.sh) 2>/dev/null

alias soda="buffalo pop"
