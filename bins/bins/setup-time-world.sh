#!/usr/bin/env bash
sudo systemctl stop ntpd
notify-send "Démarrage de la synchronisation"
sudo ntpdate 0.fr.pool.ntp.org
sudo systemctl start ntpd
