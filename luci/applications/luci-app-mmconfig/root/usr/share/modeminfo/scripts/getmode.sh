#!/bin/sh

case $1 in
	2g|3g|4g)
		SLOT=$(/usr/bin/mmcli -L | awk '{print $1}' | awk -F [\/] '{print $NF}')
		if [ $SLOT ]; then
                        SLOTCFG=$(uci -q get modemconfig.@modem[0].slot)
                        if [ ! $SLOTCFG ]; then
                                uci -q set modemconfig.@modem[0].slot=$SLOT
                                uci -q commit
                        fi
                fi
		mmcli -J -m ${SLOT} | jsonfilter -e '@["modem"]["generic"]["supported-modes"][*]' | grep $1
	;;
esac

