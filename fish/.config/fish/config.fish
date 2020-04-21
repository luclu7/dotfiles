set -x GTK_THEME Arc-Dark
set -x TERM xterm
set -x VISUAL vim
set -x EDITOR vim
set -x GO111MODULE on
set -e VTE_VERSION
set -gx PATH $PATH /home/luclu7/bins /home/luclu7/go/bin /home/luclu7/.local/bin /home/luclu7/gcc-arm/gcc-arm-none-eabi-9-2019-q4-major/bin
set -x GOPATH /home/luclu7/go
set -x ESPIDF /home/luclu7/esp-idf
set -x IDF_PATH /home/luclu7/esp-idf

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

# opam configuration
source /home/luclu7/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
