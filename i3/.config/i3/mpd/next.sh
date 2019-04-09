#!/usr/bin/env bash
mpc next
notify-send "Now playing: $(mpc current)"
