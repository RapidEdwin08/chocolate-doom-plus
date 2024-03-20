#!/bin/bash
# https://github.com/RapidEdwin08/chocolate-doom-plus v2023.03

#=======================================
# [EXAMPLEs]: $1/$2 = %ROM% +/- chocolate-setup/server
## chocolate-doom-plus.sh "/home/pi/RetroPie/roms/ports/doom/doom2.wad"
## chocolate-doom-plus.sh "/home/pi/RetroPie/roms/ports/doom/doom2.wad -file /home/pi/RetroPie/roms/ports/doom/french.wad -deh /home/pi/RetroPie/roms/ports/doom/french.deh"
## chocolate-doom-plus.sh "/home/pi/RetroPie/roms/ports/doom/doom2.wad -merge /home/pi/RetroPie/roms/ports/doom/mods/Hell2Pay/HTP-LTD.WAD /home/pi/RetroPie/roms/ports/doom/mods/Hell2Pay/HTPDMO19.WAD"
## chocolate-doom-plus.sh "server"
## chocolate-doom-plus.sh "chocolate-setup"
## chocolate-doom-plus.sh "chocolate-heretic-setup"
## chocolate-doom-plus.sh "/home/pi/RetroPie/roms/ports/doom/heretic.wad -file /home/pi/RetroPie/roms/ports/doom/mods/Hymn/HYMN.wad" chocolate-heretic-setup

#=======================================
chocdoomLOGO=$(
echo "            .-::::-.
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

#=======================================
# For Dedicated Server this script calls itself with no parameters - Displays Dedicated Server Dialog - Kills chocolate-server when [QUIT] is pressed
if [ "$1" == "" ] && [ "$0" == "/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh" ]; then
	dialog --no-collapse --ok-label QUIT --title "chocolate-doom is Running as a Dedicated Server:" --msgbox "$chocdoomLOGO Press [QUIT] to KILL SERVER and EXIT... "  25 75 </dev/tty > /dev/tty
	# Run RetroPie [runcommand-onend.sh] after Quit
	bash /opt/retropie/configs/all/runcommand-onend.sh > /dev/null 2>&1
	# kill instances of chocolate-server
	PIDrunncommandSH=$(ps -eaf | grep "chocolate-server" | awk '{print $2}')
	kill $PIDrunncommandSH > /dev/null 2>&1
	tput reset
	exit 0
fi

#=======================================
# Define corresponding chdoomPORTstring for [%ROM%]

# chocolate-doom -> DOOM1 WADs # DOOM2 WADs # FINAL DOOM WADs # FREEDOOM WADs
chdoomPORTstring="/opt/retropie/ports/chocolate-doom/chocolate-doom -iwad $1"

# chocolate-heretic -> HERETIC WADs
if [[ "$1" == *"heretic.wad"* ]] || [[ "$1" == *"heretic1.wad"* ]] || [[ "$1" == *"heretic12.wad"* ]] || [[ "$1" == *"HERETIC.WAD"* ]] || [[ "$1" == *"HERETIC1.WAD"* ]] || [[ "$1" == *"HERETIC12.WAD"* ]]; then
	chdoomPORTstring="/opt/retropie/ports/chocolate-doom/chocolate-heretic -iwad $1"
fi

# chocolate-hexen -> HEXEN WADs
if [[ "$1" == *"hexen.wad"* ]] || [[ "$1" == *"hexen0.wad"* ]] || [[ "$1" == *"HEXEN.WAD"* ]] || [[ "$1" == *"HEXEN0.WAD"* ]]; then
	chdoomPORTstring="/opt/retropie/ports/chocolate-doom/chocolate-hexen -iwad $1"
fi

# chocolate-strife -> STRIFE WADs
if [[ "$1" == *"strife0.wad"* ]] || [[ "$1" == *"strife1.wad"* ]] || [[ "$1" == *"STRIFE0.WAD"* ]] || [[ "$1" == *"STRIFE1.WAD"* ]]; then
	chdoomPORTstring="/opt/retropie/ports/chocolate-doom/chocolate-strife -iwad $1"
fi

#=======================================
# Define corresponding chdoomPORTstring + doomWAD for [chocolate-setup]
# $1 used by the [+Chocolate Doom Setup.sh] and [Chocolate Doom (Plus).sh] Scripts
# $2 used by the [chocolate-doom-plus] Setup entries in [emulators.cfg]
# For [$1] = chocolate-setup* Need to Define a corresponding doomWAD # Called from [+Chocolate Doom Setup.sh] Script
# For [$2] = chocolate-setup* Simply Define doomWAD=%ROM% # Called from [chocolate-doom-plus] Setup* Entriy in [emulators.cfg]
doomWAD="$1"

if [[ "$1" == "chocolate-setup" ]] || [[ "$2" == "chocolate-setup" ]]; then
	if [[ "$1" == "chocolate-setup" ]]; then # Specify a doomWAD when Called from [+Chocolate Doom Setup.sh] Script
		doomWAD="$HOME/RetroPie/roms/ports/doom/doom1.wad"
		if [[ -f "$HOME/RetroPie/roms/ports/doom/doom.wad" ]]; then doomWAD="$HOME/RetroPie/roms/ports/doom/doom.wad"; fi
		if [[ -f "$HOME/RetroPie/roms/ports/doom/doomu.wad" ]]; then doomWAD="$HOME/RetroPie/roms/ports/doom/doomu.wad"; fi
	fi
	chdoomPORTstring="/opt/retropie/ports/chocolate-doom/chocolate-setup -iwad $doomWAD"
fi

if [[ "$1" == "chocolate-doom-setup" ]] || [[ "$2" == "chocolate-doom-setup" ]]; then
	if [[ "$1" == "chocolate-doom-setup" ]]; then # Specify a doomWAD when Called from [+Chocolate Doom Setup.sh] Script
		doomWAD="$HOME/RetroPie/roms/ports/doom/doom1.wad"
		if [[ -f "$HOME/RetroPie/roms/ports/doom/doom.wad" ]]; then doomWAD="$HOME/RetroPie/roms/ports/doom/doom.wad"; fi
		if [[ -f "$HOME/RetroPie/roms/ports/doom/doomu.wad" ]]; then doomWAD="$HOME/RetroPie/roms/ports/doom/doomu.wad"; fi
	fi
	chdoomPORTstring="/opt/retropie/ports/chocolate-doom/chocolate-doom-setup -iwad $doomWAD"
fi

if [[ "$1" == "chocolate-heretic-setup" ]] || [[ "$2" == "chocolate-heretic-setup" ]]; then
	if [[ "$1" == "chocolate-heretic-setup" ]]; then # Specify a doomWAD when Called from [+Chocolate Doom Setup.sh] Script
		doomWAD="$HOME/RetroPie/roms/ports/doom/heretic1.wad"
		if [[ -f "$HOME/RetroPie/roms/ports/doom/heretic.wad" ]]; then doomWAD="$HOME/RetroPie/roms/ports/doom/heretic.wad"; fi
	fi
	chdoomPORTstring="/opt/retropie/ports/chocolate-doom/chocolate-heretic-setup -iwad $doomWAD"
fi

if [[ "$1" == "chocolate-hexen-setup" ]] || [[ "$2" == "chocolate-hexen-setup" ]]; then
	if [[ "$1" == "chocolate-hexen-setup" ]]; then # Specify a doomWAD when Called from [+Chocolate Doom Setup.sh] Script
		doomWAD="$HOME/RetroPie/roms/ports/doom/hexen0.wad"
		if [[ -f "$HOME/RetroPie/roms/ports/doom/hexen.wad" ]]; then doomWAD="$HOME/RetroPie/roms/ports/doom/hexen.wad"; fi
	fi
	chdoomPORTstring="/opt/retropie/ports/chocolate-doom/chocolate-hexen-setup -iwad $doomWAD"
fi

if [[ "$1" == "chocolate-strife-setup" ]] || [[ "$2" == "chocolate-strife-setup" ]]; then
	if [[ "$1" == "chocolate-strife-setup" ]]; then # Specify a doomWAD when Called from [+Chocolate Doom Setup.sh] Script
		doomWAD="$HOME/RetroPie/roms/ports/doom/strife0.wad"
		if [[ -f "$HOME/RetroPie/roms/ports/doom/strife1.wad" ]]; then doomWAD="$HOME/RetroPie/roms/ports/doom/strife1.wad"; fi
		if [[ -f "$HOME/RetroPie/roms/ports/doom/voices.wad" ]]; then doomWAD="$HOME/RetroPie/roms/ports/doom/strife1.wad -merge $HOME/RetroPie/roms/ports/doom/voices.wad"; fi
	fi
	chdoomPORTstring="/opt/retropie/ports/chocolate-doom/chocolate-strife-setup -iwad $doomWAD"
fi

#=======================================
# Run Server
if [[ "$1" == "server" ]]; then
	# Call this Script using RetroPie-Setup for Server Mode GUI with JoyPad Support & Start Server
	sudo /home/$USER/RetroPie-Setup/retropie_packages.sh retropiemenu launch "/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh" </dev/tty > /dev/tty &
	echo '/opt/retropie/ports/chocolate-doom/chocolate-server' >> /dev/shm/runcommand.log
	/opt/retropie/ports/chocolate-doom/chocolate-server
fi

# Run chdoomPORTstring + savedir
if [[ ! "$1" == "server" ]]; then
	echo "$chdoomPORTstring -savedir $HOME/RetroPie/roms/ports/doom/chocolate-doom-saves" >> /dev/shm/runcommand.log
	$chdoomPORTstring -savedir $HOME/RetroPie/roms/ports/doom/chocolate-doom-saves
fi
