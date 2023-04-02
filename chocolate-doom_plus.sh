#!/usr/bin/env bash
# https://github.com/RapidEdwin08/chocolate-doom-plus
version=2023.03

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

chocDOOMcfg=$(
echo 'chocolate-setup = "/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh %ROM% chocolate-setup"
chocolate-doom-setup = "/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh %ROM% chocolate-doom-setup"
chocolate-heretic-setup = "/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh %ROM% chocolate-heretic-setup"
chocolate-hexen-setup = "/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh %ROM% chocolate-hexen-setup"
chocolate-strife-setup = "/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh %ROM% chocolate-strife-setup"
chocolate-server+ = "/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh server"
chocolate-doom+ = "/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh %ROM%"
default = "chocolate-doom+"
'
)

chocDOOMsh=$(
echo '#!/bin/bash
# https://github.com/RapidEdwin08/chocolate-doom-plus v2023.03

"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "chocolate-doom-plus" "$HOME/RetroPie/roms/ports/doom/doom1.wad"

'
)

chocDOOMplusREFS=$(
echo '# What is Chocolate D00M?
Chocolate Doom is a Doom source port that accurately reproduces the experience of Doom as it was played in the 1990s.
Requires a *KEYBOARD* but Use of a JoyPad is Supported

# Why use Chocolate D00M
While Limited in terms of M0Ds, it is a Great Authentic D00M Experience
Chocolate Doom is also Great for Low-End Hardware such as rPi 1/0

# Where to get Chocolate D00M P0RTs:
https://github.com/Exarkuniv/RetroPie-Extra
    .../scriptmodules/ports/chocolate-doom.sh

# How to use:
INSTALL [chocolate-doom] from RetroPie SETUP 1st...
INSTALL [chocolate-doom-plus] additional Emulator Entries
If Needed SET SOUND SETTINGS: Native MIDI [/etc/timidity/timidity.cfg]

# [chocolate-doom+] Features:
Ability to include additional -file -merge -deh in your R0M-Scripts.sh
Auto adds -savedir [~RetroPie/roms/ports/doom/chocolate-doom-saves]
Also includes R0M-Script for Chocolate D00M Setup Selection + Server

[+Chocolate Doom Setup.sh]: Can be placed in ..roms/ports/*
Single Script to Select chocolate-setup for doom heretic hexen strife
Also includes Dedicated Server Mode

# Chocolate-D00M-Plus R0M-Scripts.sh:
[Chocolate Doom (Plus).sh]: Can be placed in ..roms/ports/*
A Template Script for use with chocolate-doom-plus

# _P0RT_ Names for R0M-Scripts:
 _PORT_ "chocolate-doom-plus" "%ROM% +Xtra Parameters"
 _PORT_ "doom" "%ROM%" (+Xtra Parameters May not work with 0ther P0RTs)

======================================================================
CURRENT CONTENT [/opt/retropie/configs/ports/chocolate-doom-plus/emulators.cfg]:                   
======================================================================
')

mainMENU()
{

# WARN IF [/opt/retropie/ports/chocolate-doom] N0T Found 
if [ ! -f /opt/retropie/ports/chocolate-doom/chocolate-doom ]; then
	dialog --no-collapse --title "***N0TICE*** [../opt/retropie/ports/chocolate-doom] NOT FOUND!" --ok-label MENU --msgbox "You MUST INSTALL chocolate-doom from RetroPie Setup 1st! [chocolate-doom]"  25 75
fi
# Confirm Configurations
confCHOCdoomplus=$(dialog --no-collapse --title " [chocolate-doom-plus] for RetroPie by: RapidEdwin08 [v$version]" \
	--ok-label OK --cancel-label EXIT \
	--menu "$chocdoomLOGO" 25 75 20 \
	1 "><  INSTALL [chocolate-doom+] for RetroPie ><" \
	2 "><  REMOVE  [chocolate-doom+] for RetroPie ><" \
	3 "><  GET [chocolate-doom] P0RT for RetroPie ><" \
	S "><  OPEN [RetroPie-Setup] ><" \
	R "><  REFERENCES  ><" 2>&1>/dev/tty)

# INSTALL [chocolate-doom+]
if [ "$confCHOCdoomplus" == '1' ]; then
	confINSTALLchocdoomplus=$(dialog --no-collapse --title "               INSTALL [chocolate-doom+] for RetroPie             " \
		--ok-label OK --cancel-label BACK \
		--menu "                          ? ARE YOU SURE ?             \n                [chocolate-doom+]  [chocolate-doom-plus] " 25 75 20 \
		1 "><  YES INSTALL [chocolate-doom+] for RetroPie  ><" \
		2 "><  BACK  ><" 2>&1>/dev/tty)
	# Install Confirmed - Otherwise Back to Main Menu
	if [ "$confINSTALLchocdoomplus" == '1' ]; then
		tput reset
		# WARN IF [/opt/retropie/ports/chocolate-doom/chocolate-doom] N0T Found
		if [ ! -f /opt/retropie/ports/chocolate-doom/chocolate-doom ]; then
			dialog --no-collapse --title "***N0TICE*** [/opt/retropie/ports/chocolate-doom] NOT FOUND!" --ok-label MENU --msgbox "You MUST INSTALL chocolate-doom from RetroPie Setup 1st! [chocolate-doom]"  25 75
			mainMENU
		fi
		
		# Add [chocolate-doom+] SH - REQUIRES INTERNET
		wget https://raw.githubusercontent.com/RapidEdwin08/chocolate-doom-plus/main/chocolate-doom-plus.sh -P /dev/shm
		
		# CHECK for REQUIRED [chocolate-doom-plus.sh] - MAIN MENU IF NOT FOUND
		if [ ! -f /dev/shm/chocolate-doom-plus.sh ]; then
			dialog --no-collapse --title "***N0TICE*** [chocolate-doom-plus.sh] NOT FOUND!" --ok-label MENU --msgbox "CHECK INTERNET CONNECTION AND RETRY INSTALL/DOWNLOAD [chocolate-doom-plus.sh]"  25 75
			mainMENU
		else
			mkdir /opt/retropie/configs/ports/chocolate-doom-plus > /dev/null 2>&1
			mv /dev/shm/chocolate-doom-plus.sh /opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh 2>/dev/null
			sudo chmod 755 /opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh 2>/dev/null
			
			# Backup emulators.cfg if not exist already
			if [ ! -f /opt/retropie/configs/ports/doom/emulators.cfg.b4chd ]; then cp /opt/retropie/configs/ports/doom/emulators.cfg /opt/retropie/configs/ports/doom/emulators.cfg.b4chd 2>/dev/null; fi
			
			# Rebuild ..config/doom/emulators.cfg with chocolate-doom+
			cat /opt/retropie/configs/ports/doom/emulators.cfg | grep -v 'chocolate-doom+' | grep -v 'chocolate-server+' > /dev/shm/emulators.cfg
			#echo 'chocolate-server+ = "/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh server"' >> /dev/shm/emulators.cfg
			echo 'chocolate-doom+ = "/opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh %ROM%"' >> /dev/shm/emulators.cfg
			mv /dev/shm/emulators.cfg /opt/retropie/configs/ports/doom/emulators.cfg 2>/dev/null
			
			# Add chocolate-doom+ Scripts to ..roms/ports
			wget https://raw.githubusercontent.com/RapidEdwin08/chocolate-doom-plus/main/'Chocolate Doom Setup.sh' -P /dev/shm
			mv "/dev/shm/Chocolate Doom Setup.sh" "$HOME/RetroPie/roms/ports/+Chocolate Doom Setup.sh" > /dev/null 2>&1
			#wget https://raw.githubusercontent.com/RapidEdwin08/chocolate-doom-plus/main/'Chocolate D00M (Plus).sh' -P /dev/shm
			echo "$chocDOOMsh" > "/dev/shm/Chocolate D00M (Plus).sh"
			mv "/dev/shm/Chocolate D00M (Plus).sh" "$HOME/RetroPie/roms/ports/Chocolate D00M (Plus).sh" > /dev/null 2>&1
			
			echo "$chocDOOMsh" > /dev/shm/CDPlus.sh
			sed -i "s+doom1.wad+freedoom1.wad+g" /dev/shm/CDPlus.sh
			mv /dev/shm/CDPlus.sh "$HOME/RetroPie/roms/ports/Chocolate Freedoom1 (Plus).sh"
			
			echo "$chocDOOMsh" > /dev/shm/CDPlus.sh
			sed -i "s+doom1.wad+freedoom2.wad+g" /dev/shm/CDPlus.sh
			mv /dev/shm/CDPlus.sh "$HOME/RetroPie/roms/ports/Chocolate Freedoom2 (Plus).sh"
		fi
		
		# Add [chocolate-doom+] to [emulators.cfg]
		echo "$chocDOOMcfg" > /dev/shm/emulators.cfg
		mv /dev/shm/emulators.cfg /opt/retropie/configs/ports/chocolate-doom-plus/emulators.cfg 2>/dev/null

		dialog --no-collapse --title " INSTALL [chocolate-doom+] for RetroPie FINISHED" --ok-label Back --msgbox "  CURRENT CONTENT [opt/retropie/configs/ports/chocolate-doom-plus/emulators.cfg]:  $(cat /opt/retropie/configs/ports/chocolate-doom-plus/emulators.cfg)"  25 75
		mainMENU
	fi
	mainMENU
fi

# REMOVE [chocolate-doom+]
if [ "$confCHOCdoomplus" == '2' ]; then
	confREMOVEchocdoomplus=$(dialog --no-collapse --title "          REMOVE [chocolate-doom+] for RetroPie              " \
		--ok-label OK --cancel-label BACK \
		--menu "                          ? ARE YOU SURE ?             " 25 75 20 \
		1 "><  YES REMOVE [chocolate-doom+] for RetroPie  ><" \
		2 "><  BACK  ><" 2>&1>/dev/tty)
	# Remove Confirmed - Otherwise Back to Main Menu
	if [ "$confREMOVEchocdoomplus" == '1' ]; then
		tput reset
		# Remove chocolate-doom+ Config
		rm /opt/retropie/configs/ports/chocolate-doom-plus/emulators.cfg > /dev/null 2>&1
		rm /opt/retropie/configs/ports/chocolate-doom-plus/chocolate-doom-plus.sh > /dev/null 2>&1
		rm -d /opt/retropie/configs/ports/chocolate-doom-plus > /dev/null 2>&1
		
		# Remove chocolate-doom+ Scripts from ..roms/ports
		rm "$HOME/RetroPie/roms/ports/Chocolate D00M (Plus).sh" > /dev/null 2>&1
		rm "$HOME/RetroPie/roms/ports/Chocolate Freedoom1 (Plus).sh" > /dev/null 2>&1
		rm "$HOME/RetroPie/roms/ports/Chocolate Freedoom2 (Plus).sh" > /dev/null 2>&1
		rm "$HOME/RetroPie/roms/ports/+Chocolate Doom Setup.sh" > /dev/null 2>&1
		
		# Backup emulators.cfg if not exist already
		if [ ! -f /opt/retropie/configs/ports/doom/emulators.cfg.b4chd ]; then cp /opt/retropie/configs/ports/doom/emulators.cfg /opt/retropie/configs/ports/doom/emulators.cfg.b4chd 2>/dev/null; fi
		
		# Rebuild ..config/doom/emulators.cfg with0UT chocolate-doom+
		cat /opt/retropie/configs/ports/doom/emulators.cfg | grep -v 'chocolate-doom+' | grep -v 'chocolate-server+' > /dev/shm/emulators.cfg
		mv /dev/shm/emulators.cfg /opt/retropie/configs/ports/doom/emulators.cfg 2>/dev/null
		
		dialog --no-collapse --title " REMOVE [chocolate-doom+] for RetroPie FINISHED" --ok-label Back --msgbox " chocolate-doom-plus REMOVED . . . "  25 75
		mainMENU
	fi
	mainMENU
fi

# GET [chocolate-doom] from GIT
if [ "$confCHOCdoomplus" == '3' ]; then
	gitCHDOOMports=$(dialog --no-collapse --title "           GET [chocolate-doom] P0RT for RetroPie             " \
		--ok-label OK --cancel-label BACK \
		--menu "                          ? ARE YOU SURE ?             \n \n This will GIT/UPDATE/OVERWRITE [chocolate-doom] scriptmodules in RetroPie-Setup \n \n  /home/$USER/RetroPie-Setup/ext/RetroPie-Extra/scriptmodules/ports/* \n \n             https://github.com/Exarkuniv/RetroPie-Extra/          \n \n $(ls ~/RetroPie-Setup/ext/RetroPie-Extra/scriptmodules/ports/ | grep 'chocolate-doom' )" 25 75 20 \
		1 "><  YES GET  [chocolate-doom] P0RT for RetroPie ><" \
		2 "><  BACK  ><" 2>&1>/dev/tty)
	# Install Confirmed - Otherwise Back to Main Menu
	if [ "$gitCHDOOMports" == '1' ]; then
		tput reset
		# GIT CHDOOM P0RTs - Check If Internet Connection Available
		wget -q --spider http://google.com
		if [ $? -eq 0 ]; then
			mkdir ~/RetroPie-Setup/ext/RetroPie-Extra > /dev/null 2>&1
			mkdir ~/RetroPie-Setup/ext/RetroPie-Extra/scriptmodules > /dev/null 2>&1
			mkdir ~/RetroPie-Setup/ext/RetroPie-Extra/scriptmodules/ports > /dev/null 2>&1
			wget https://raw.githubusercontent.com/Exarkuniv/RetroPie-Extra/master/scriptmodules/ports/chocolate-doom.sh -P /dev/shm/; mv /dev/shm/chocolate-doom.sh ~/RetroPie-Setup/ext/RetroPie-Extra/scriptmodules/ports/
			#wget https://raw.githubusercontent.com/Exarkuniv/RetroPie-Extra/master/scriptmodules/ports/chocolate-doom-system.sh -P /dev/shm/; mv /dev/shm/chocolate-doom-system.sh ~/RetroPie-Setup/ext/RetroPie-Extra/scriptmodules/ports/
		else
			# No Internet - Back to Main Menu
			dialog --no-collapse --title "               [ERROR]               " --msgbox "   *INTERNET CONNECTION REQUIRED* TO GIT CHDOOM P0RTs"  25 75
			mainMENU
		fi
		dialog --no-collapse --title " GET [chocolate-doom] P0RT for RetroPie FINISHED" --ok-label Back --msgbox "  RetroPie Setup -> Manage Packages -> Manage experimental packages"  25 75
		mainMENU
	fi
	mainMENU
fi

# Open RPSetup
if [ "$confCHOCdoomplus" == 'S' ]; then
	confiRPsetup=$(dialog --no-collapse --title " RetroPie Setup -> Manage Packages -> Experimental Packages" \
		--ok-label OK --cancel-label Back \
		--menu "                          ? ARE YOU SURE ?              \n $(ls ~/RetroPie-Setup/ext/RetroPie-Extra/scriptmodules/ports/ | grep 'chocolate-doom' )" 25 75 20 \
		Y "YES OPEN [RetroPie-Setup]" \
		B "BACK" 2>&1>/dev/tty)
	if [ "$confiRPsetup" == 'Y' ]; then
		cd ~/RetroPie-Setup/ && sudo bash ~/RetroPie-Setup/retropie_setup.sh
		#sudo bash ~/RetroPie-Setup/retropie_packages.sh retropiemenu launch "/home/$USER/RetroPie-Setup/retropie_setup.sh" </dev/tty > /dev/tty
		exit 0
	fi
	mainMENU
fi

# REFERENCES
if [ "$confCHOCdoomplus" == 'R' ]; then	
	dialog --no-collapse --title " REFERENCES" --ok-label Back --msgbox "$chocDOOMplusREFS $(cat /opt/retropie/configs/ports/chocolate-doom-plus/emulators.cfg)"  25 75
	mainMENU
fi

# QUIT if N0T Confirmed
if [ "$confCHOCdoomplus" == '' ]; then
	tput reset
	exit 0
fi

tput reset
exit 0
}

mainMENU

tput reset
exit 0
