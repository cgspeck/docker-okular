#!/bin/bash
mkdir -p /config/config
mkdir -p /nobody/.kde/share/apps
ln -s /config/config /nobody/.kde/share/apps/okular
chown -R nobody:users /config
chown -R nobody:users /nobody
chmod -R g+rw /config
[[ -f /tmp/.X1-lock ]] && rm /tmp/.X1-lock && echo "X1-lock found, deleting"

