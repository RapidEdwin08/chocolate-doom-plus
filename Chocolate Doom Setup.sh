#!/bin/bash
# https://github.com/RapidEdwin08

joy2key=/opt/retropie/admin/joy2key/joy2key
sudo $joy2key stop 2>/dev/null
$joy2key start

chocdoomLOGO=$(
echo "            .-::::-.
           /        \\
           :        :         ______  _____  _____ ___  ___
           /:---:--:\\         |  _  \|  _  ||  _  ||  \/  |
          :          :        | | | || |/' || |/' || .  . |
          \\.--.---.-./        | | | ||  /| ||  /| || |\/| |
          (_.--._.-._)        | |/ / \ |_/ /\ |_/ /| |  | |
            \\=-=-=-/          |___/   \___/  \___/ \_|  |_/
             \\=-=-/
              \\=-/"
)
#       \\/

mainMENU()
{
# Confirm Utility
pickUTIL=$(dialog --no-collapse --title "  [Chocolate D00M SETUP]" \
	--ok-label OK --cancel-label EXIT \
	--menu "$chocdoomLOGO" 25 75 20 \
	0 " Chocolate-Setup [*] " \
	1 " Chocolate-Setup [Doom] " \
	2 " Chocolate-Setup [Heretic] " \
	3 " Chocolate-Setup [Hexen] " \
	4 " Chocolate-Setup [Strife] " \
	S " Chocolate-Server [*] " \
	X " EXIT " 2>&1>/dev/tty)
	
# Utilities
if [ ! "$pickUTIL" == '' ]; then
	if [ "$pickUTIL" == '0' ]; then
		sudo $joy2key stop 2>/dev/null
		tput reset
		#"/opt/retropie/ports/chocolate-doom/chocolate-setup" > /dev/null 2>&1
		"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "chocolate-doom-plus" "chocolate-setup"
		exit 0
	fi
	
	if [ "$pickUTIL" == '1' ]; then
		sudo $joy2key stop 2>/dev/null
		tput reset
		#"/opt/retropie/ports/chocolate-doom/chocolate-doom-setup" > /dev/null 2>&1
		"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "chocolate-doom-plus" "chocolate-doom-setup"
		exit 0
	fi
	
	if [ "$pickUTIL" == '2' ]; then
		sudo $joy2key stop 2>/dev/null
		tput reset
		#"/opt/retropie/ports/chocolate-doom/chocolate-heretic-setup" > /dev/null 2>&1
		"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "chocolate-doom-plus" "chocolate-heretic-setup"
		exit 0
	fi
	
	if [ "$pickUTIL" == '3' ]; then
		sudo $joy2key stop 2>/dev/null
		tput reset
		#"/opt/retropie/ports/chocolate-doom/chocolate-hexen-setup" > /dev/null 2>&1
		"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "chocolate-doom-plus" "chocolate-hexen-setup"
		exit 0
	fi
	
	if [ "$pickUTIL" == '4' ]; then
		sudo $joy2key stop 2>/dev/null
		tput reset
		#"/opt/retropie/ports/chocolate-doom/chocolate-strife-setup" > /dev/null 2>&1
		"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "chocolate-doom-plus" "chocolate-strife-setup"
		exit 0
	fi
	
	if [ "$pickUTIL" == 'S' ]; then
		sudo $joy2key stop 2>/dev/null
		tput reset
		#"/opt/retropie/ports/chocolate-doom/chocolate-setup" > /dev/null 2>&1
		"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "chocolate-doom-plus" "server"
		exit 0
	fi
	
	if [ "$pickUTIL" == 'X' ]; then
		sudo $joy2key stop 2>/dev/null
		tput reset
		exit 0
	fi
	
	mainMENU
fi

if [ "$pickUTIL" == '' ]; then sudo $joy2key stop 2>/dev/null; tput reset; exit 0; fi

mainMENU
}


mainMENU
sudo $joy2key stop 2>/dev/null
tput reset
exit 0
