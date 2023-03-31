#!/bin/bash
# https://github.com/RapidEdwin08/chocolate-doom-plus

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
	# kill instances of runcommand scripts
	PIDrunncommandSH=$(ps -eaf | grep "chocolate-server" | awk '{print $2}')
	kill $PIDrunncommandSH > /dev/null 2>&1
	exit 0
fi

#=======================================
# Define corresponding P0RT for doomWADs

# chocolate-doom -> DOOM1 WADs # DOOM2 WADs # FINAL DOOM WADs # FREEDOOM WADs
chocdoomSTRING="/opt/retropie/ports/chocolate-doom/chocolate-doom -iwad $1"

# chocolate-heretic -> HERETIC WADs
if [[ "$1" == *"heretic.wad"* ]] || [[ "$1" == *"heretic1.wad"* ]] || [[ "$1" == *"heretic12.wad"* ]] || [[ "$1" == *"HERETIC.WAD"* ]] || [[ "$1" == *"HERETIC1.WAD"* ]] || [[ "$1" == *"HERETIC12.WAD"* ]]; then
	chocdoomSTRING="/opt/retropie/ports/chocolate-doom/chocolate-heretic -iwad $1"
fi

# chocolate-hexen -> HEXEN WADs
if [[ "$1" == *"hexen.wad"* ]] || [[ "$1" == *"hexen0.wad"* ]] || [[ "$1" == *"HEXEN.WAD"* ]] || [[ "$1" == *"HEXEN0.WAD"* ]]; then
	chocdoomSTRING="/opt/retropie/ports/chocolate-doom/chocolate-hexen -iwad $1"
fi

# chocolate-strife -> STRIFE WADs
if [[ "$1" == *"strife0.wad"* ]] || [[ "$1" == *"strife1.wad"* ]] || [[ "$1" == *"STRIFE0.WAD"* ]] || [[ "$1" == *"STRIFE1.WAD"* ]]; then
	chocdoomSTRING="/opt/retropie/ports/chocolate-doom/chocolate-strife -iwad $1"
fi

#=======================================
# Chocolate D00M SETUPs - Define corresponding doomWADs - Mainly used for +Chocolate Doom Setup.sh
if [[ "$1" == "chocolate-setup" ]] || [[ "$1" == "chocolate-doom-setup" ]]; then
	doomWAD="$HOME/RetroPie/roms/ports/doom/doom1.wad"
	if [[ -f "$HOME/RetroPie/roms/ports/doom/doom.wad" ]]; then doomWAD="$HOME/RetroPie/roms/ports/doom/doom.wad"; fi
	if [[ -f "$HOME/RetroPie/roms/ports/doom/doomu.wad" ]]; then doomWAD="$HOME/RetroPie/roms/ports/doom/doomu.wad"; fi
	if [[ "$1" == "chocolate-setup" ]]; then chocdoomSTRING="/opt/retropie/ports/chocolate-doom/chocolate-setup -iwad $doomWAD"; fi
	if [[ "$1" == "chocolate-doom-setup" ]]; then chocdoomSTRING="/opt/retropie/ports/chocolate-doom/chocolate-doom-setup -iwad $doomWAD"; fi
fi

if [[ "$1" == "chocolate-heretic-setup" ]]; then
	doomWAD="$HOME/RetroPie/roms/ports/doom/heretic1.wad"
	if [[ -f "$HOME/RetroPie/roms/ports/doom/heretic.wad" ]]; then doomWAD="$HOME/RetroPie/roms/ports/doom/heretic.wad"; fi
	chocdoomSTRING="/opt/retropie/ports/chocolate-doom/chocolate-heretic-setup -iwad $doomWAD"
fi

if [[ "$1" == "chocolate-hexen-setup" ]]; then
	doomWAD="$HOME/RetroPie/roms/ports/doom/hexen0.wad"
	if [[ -f "$HOME/RetroPie/roms/ports/doom/hexen.wad" ]]; then doomWAD="$HOME/RetroPie/roms/ports/doom/hexen.wad"; fi
	chocdoomSTRING="/opt/retropie/ports/chocolate-doom/chocolate-hexen-setup -iwad $doomWAD"
fi

if [[ "$1" == "chocolate-strife-setup" ]]; then
	doomWAD="$HOME/RetroPie/roms/ports/doom/strife0.wad"
	if [[ -f "$HOME/RetroPie/roms/ports/doom/strife1.wad" ]]; then doomWAD="$HOME/RetroPie/roms/ports/doom/strife1.wad"; fi
	chocdoomSTRING="/opt/retropie/ports/chocolate-doom/chocolate-strife-setup -iwad $HOME/RetroPie/roms/ports/doom/strife1.wad"
fi

#=======================================
# Run Server
if [[ "$1" == "server" ]]; then
	sudo /home/$USER/RetroPie-Setup/retropie_packages.sh retropiemenu launch "/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh" </dev/tty > /dev/tty &
	echo '/opt/retropie/ports/chocolate-doom/chocolate-server' >> /dev/shm/runcommand.log
	/opt/retropie/ports/chocolate-doom/chocolate-server
fi

# Run P0RT
if [[ ! "$1" == "server" ]]; then
	echo "$chocdoomSTRING" >> /dev/shm/runcommand.log
	$chocdoomSTRING -savedir $HOME/RetroPie/roms/ports/doom/chocolate-doom-saves
fi
