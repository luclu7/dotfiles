#!/usr/bin/env bash
mpc prev
notify-send "Now playing: $(mpc current)"
