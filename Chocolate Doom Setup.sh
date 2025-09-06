#!/bin/bash
# https://github.com/RapidEdwin08/chocolate-doom-plus v2023.03
# Can be placed in ..roms/ports/* or ..roms/doom/*
# [chocolate-doom-plus] Recommended but NOT Required

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

SRVchocdoomLOGO=$(
echo "           chocolate-doom is Running as a Dedicated Server:
            .-::::-.
           /        \\        $(hostname -I | tr -d ' ') / `curl -4 icanhazip.com 2>/dev/null | awk '{print $NF; exit}'`
           :        :         ______  _____  _____ ___  ___
           /:---:--:\\         |  _  \|  _  ||  _  ||  \/  |
          :          :        | | | || |/' || |/' || .  . |
          \\.--.---.-./        | | | ||  /| ||  /| || |\/| |
          (_.--._.-._)        | |/ / \ |_/ /\ |_/ /| |  | |
            \\=-=-=-/          |___/   \___/  \___/ \_|  |_/
             \\=-=-/
              \\=-/
			  
   Registered with master server at master.chocolate-doom.org:2342   
		
"
)

joy2key=/opt/retropie/admin/joy2key/joy2key
joy2keyFLAG=0
if [[ "$0" == *"/roms/"* ]]; then joy2keyFLAG=1; fi
if [[ "$joy2keyFLAG" == "1" ]]; then sudo $joy2key stop 2>/dev/null; $joy2key start; fi

runcommandFLAG=1
if [[ "$0" == *"/opt/retropie/ports/chocolate-doom/"* ]]; then runcommandFLAG=0; fi
if [[ "$0" == *"/retropiemenu/"* ]] || [[ ! -f /opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh ]]; then runcommandFLAG=0; fi
if [[ "$0" == "/usr/bin/"* ]] && [[ -f /opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh ]]; then runcommandFLAG=2; fi

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
		if [[ "$joy2keyFLAG" == "1" ]]; then sudo $joy2key stop 2>/dev/null; fi
		tput reset
		if [[ "$runcommandFLAG" == "1" ]]; then
			"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "chocolate-doom-plus" "chocolate-setup"
		elif [[ "$runcommandFLAG" == "2" ]]; then
			"/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh" chocolate-doom-setup
		else
			"/opt/retropie/ports/chocolate-doom/chocolate-setup" > /dev/null 2>&1
		fi
		exit 0
	fi
	
	if [ "$pickUTIL" == '1' ]; then
		if [[ "$joy2keyFLAG" == "1" ]]; then sudo $joy2key stop 2>/dev/null; fi
		tput reset
		if [[ "$runcommandFLAG" == "1" ]]; then
			"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "chocolate-doom-plus" "chocolate-doom-setup"
		elif [[ "$runcommandFLAG" == "2" ]]; then
			"/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh" chocolate-doom-setup
		else
			"/opt/retropie/ports/chocolate-doom/chocolate-doom-setup" > /dev/null 2>&1
		fi
		exit 0
	fi
	
	if [ "$pickUTIL" == '2' ]; then
		if [[ "$joy2keyFLAG" == "1" ]]; then sudo $joy2key stop 2>/dev/null; fi
		tput reset
		if [[ "$runcommandFLAG" == "1" ]]; then
			"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "chocolate-doom-plus" "chocolate-heretic-setup"
		elif [[ "$runcommandFLAG" == "2" ]]; then
			"/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh" chocolate-heretic-setup
		else
			"/opt/retropie/ports/chocolate-doom/chocolate-heretic-setup" > /dev/null 2>&1
		fi
		exit 0
	fi
	
	if [ "$pickUTIL" == '3' ]; then
		if [[ "$joy2keyFLAG" == "1" ]]; then sudo $joy2key stop 2>/dev/null; fi
		tput reset
		if [[ "$runcommandFLAG" == "1" ]]; then
			"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "chocolate-doom-plus" "chocolate-hexen-setup"
		elif [[ "$runcommandFLAG" == "2" ]]; then
			"/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh" chocolate-hexen-setup
		else
			"/opt/retropie/ports/chocolate-doom/chocolate-hexen-setup" > /dev/null 2>&1
		fi
		exit 0
	fi
	
	if [ "$pickUTIL" == '4' ]; then
		if [[ "$joy2keyFLAG" == "1" ]]; then sudo $joy2key stop 2>/dev/null; fi
		tput reset
		if [[ "$runcommandFLAG" == "1" ]]; then
			"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "chocolate-doom-plus" "chocolate-strife-setup"
		elif [[ "$runcommandFLAG" == "2" ]]; then
			"/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh" chocolate-strife-setup
		else
			"/opt/retropie/ports/chocolate-doom/chocolate-strife-setup" > /dev/null 2>&1
		fi
		exit 0
	fi
	
	if [ "$pickUTIL" == 'S' ]; then
		if [[ "$joy2keyFLAG" == "1" ]]; then sudo $joy2key stop 2>/dev/null; fi
		tput reset
		if [[ "$runcommandFLAG" == "1" ]]; then "/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "chocolate-doom-plus" "server"
		elif [[ "$runcommandFLAG" == "2" ]]; then
			"/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh"
		elif [[ "$0" == *"/retropiemenu/"* ]] && [[ -f /opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh ]]; then
			"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "chocolate-doom-plus" "server"
		else
			echo ""
			echo "$SRVchocdoomLOGO Press [CTRL-C] to KILL SERVER and EXIT... "
			"/opt/retropie/ports/chocolate-doom/chocolate-server" > /dev/null 2>&1
			# kill instances of chocolate-server
			PIDrunncommandSH=$(ps -eaf | grep "chocolate-server" | awk '{print $2}')
			kill $PIDrunncommandSH > /dev/null 2>&1
			tput reset
		fi
		exit 0
	fi
	
	if [ "$pickUTIL" == 'X' ]; then
		if [[ "$joy2keyFLAG" == "1" ]]; then sudo $joy2key stop 2>/dev/null; fi
		tput reset
		exit 0
	fi
	
	mainMENU
fi

if [ "$pickUTIL" == '' ]; then
	if [[ "$joy2keyFLAG" == "1" ]]; then sudo $joy2key stop 2>/dev/null; fi
	tput reset
	exit 0
fi

mainMENU
}


mainMENU
if [[ "$joy2keyFLAG" == "1" ]]; then sudo $joy2key stop 2>/dev/null; fi
tput reset
exit 0
