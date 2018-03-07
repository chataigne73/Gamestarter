#!/bin/sh
. /etc/profile

DIR="/storage/.kodi/addons/game.retroarch"

echo "retroarch addon.sh" >> /storage/.kodi/temp/emulationstation.log
systemd-run $DIR/addon.start "$@" >> /storage/.kodi/temp/emulationstation.log
