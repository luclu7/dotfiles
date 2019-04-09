#!/usr/bin/env bash
sleep 30
sudo systemctl stop ntpd
sudo ntpdate 0.fr.pool.ntp.org
sudo systemctl start ntpd
