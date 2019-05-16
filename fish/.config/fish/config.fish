set -x GTK_THEME Arc-Dark
set -x TERM xterm
set -x VISUAL vim
set -x EDITOR vim
alias docker="sudo docker"
set -e VTE_VERSION

set -gx PATH $PATH /home/luclu7/bins
set -x GOPATH /home/luclu7/go

# abbreviations
abbr l 'ls -lash'
abbr i 'sxiv'
abbr d 'sudo docker'
abbr nss 'systemctl'
abbr s 'sudo systemctl'
abbr ca 'curl -vvI -k'
