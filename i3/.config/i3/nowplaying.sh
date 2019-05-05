#!/usr/bin/env bash
current=$(mpc current)
if [[ -z $current ]]
then
	current="nothing"
fi

notify-send -i audio-headphones "Now playing: $current"
