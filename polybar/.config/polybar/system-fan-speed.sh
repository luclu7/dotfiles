#!/usr/bin/env bash

speed=$(sensors | grep fan1 | cut -d " " -f 9)
if [[ $speed =~ [0-9] ]]; then
		echo $speed RPM
	else
		echo "0 RPM"
fi
