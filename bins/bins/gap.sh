#!/usr/bin/env bash
# generate and public hugo sites
hugo check
hugo
rsync -ravs public/ t3:/var/www/$(basename $PWD)
