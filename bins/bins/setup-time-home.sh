#!/usr/bin/env bash
sudo systemctl stop ntpd
sudo ntpdate 192.168.1.1
sudo systemctl start ntpd
