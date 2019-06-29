set -x GTK_THEME Arc-Dark
set -x TERM xterm
set -x VISUAL vim
set -x EDITOR vim
source /home/luclu7/.cargo/env
alias docker="sudo docker"
set -x PATH /home/luclu7/.cargo/bin /home/luclu7/.cargo/bin /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/lib/jvm/default/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl /usr/scripts/ /home/luclu7/bins /home/luclu7/.gem/ruby/2.5.0/bin /home/luclu7/scripts/cron /home/luclu7/scripts/i3cmds /home/luclu7/scripts/statusbar /home/luclu7/scripts/tools /opt/devkitpro/tools/bin /opt/devkitpro/devkitARM/bin /home/luclu7/go/bin /home/luclu7/.vim/bundle/vim-live-latex-preview/bin
set -e VTE_VERSION

# abbreviations
abbr l 'ls -lash'
abbr i 'sxiv'
abbr d 'sudo docker'
abbr nss 'systemctl'
abbr s 'sudo systemctl'
abbr ca 'curl -vvI -k'

alias soda="buffalo pop"
