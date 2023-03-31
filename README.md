# chocolate-doom-plus (chocolate-doom+)  
![chocolate-doom_plus.png](https://raw.githubusercontent.com/RapidEdwin08/chocolate-doom-plus/main/chocolate-doom_plus.png)  
[chocolate-doom+] Easily add Load IWADs, M0Ds, -file, and -deh for Chocolate D00M R0Ms in RetroPie.  

## What is Chocolate D00M?  
Chocolate Doom is a Doom source port that accurately reproduces the experience of Doom as it was played in the 1990s.  
Requires a *KEYBOARD* but Use of a JoyPad is Supported  

## Why use Chocolate D00M?  
While Limited in terms of M0Ds, it is a Great Authentic D00M Experience  
Chocolate Doom is also Great for Low-End Hardware such as rPi 1/0  

## INSTALLATION  
***You MUST INSTALL Chocolate Doom from RetroPie Setup 1st! [chocolate-doom]***  
*eg. from [Exarkuniv/RetroPie-Extra/ports/chocolate-doom](https://github.com/Exarkuniv/RetroPie-Extra/blob/master/scriptmodules/ports/chocolate-doom.sh)  

If you want to 1-Run-N-Done:
```bash
curl -sSL https://raw.githubusercontent.com/RapidEdwin08/chocolate-doom-plus/main/chocolate-doom_plus.sh  | bash
```

If you want to Put the Install Script in the retropiemenu [+Icon]:  
```bash
wget https://raw.githubusercontent.com/RapidEdwin08/chocolate-doom-plus/main/chocolate-doom_plus.sh -P ~/RetroPie/retropiemenu
wget https://raw.githubusercontent.com/RapidEdwin08/chocolate-doom-plus/main/chocolate-doom_plus.png -P ~/RetroPie/retropiemenu/icons
```

0ptionally you can Add an Entry [+Icon] to your retropiemenu [gamelist.xml]:  
*Example Entry:*  
```
	<game>
		<path>./chocolate-doom_plus.sh</path>
		<name>[chocolate-doom+] Chocolate D00M Plus</name>
		<desc>Configure [chocolate-doom+] for [RetroPie].</desc>
		<image>./icons/chocolate-doom_plus.png</image>
	</game>
```

If you want to GIT it All:  
```bash
cd ~
git clone --depth 1 https://github.com/RapidEdwin08/chocolate-doom-plus.git
sudo chmod 755 ~/chocolate-doom-plus/chocolate-doom_plus.sh
cd ~/chocolate-doom-plus && ./chocolate-doom_plus.sh

```

If you want to GET 0nly the Chocolate-D00M-Plus-Template.sh: 
```bash
wget https://raw.githubusercontent.com/RapidEdwin08/chocolate-doom-plus/main/Chocolate\ D00M\ \(Plus\).sh -P ~/RetroPie/roms/ports
```

## How to use:
INSTALL [chocolate-doom] from RetroPie SETUP 1st...  
INSTALL [chocolate-doom-plus] additional Emulator Entries  
If Needed ***SET SOUND SETTINGS*** to timidity [/etc/timidity/timidity.cfg]  

**[chocolate-doom+] Features:**  
Ability to include additional -file -merge -deh in your R0M-Scripts.sh  
Auto adds -savedir [~RetroPie/roms/ports/doom/chocolate-doom-saves]  
Also includes R0M-Script for Chocolate D00M Setup Selection + Server  

**Chocolate-D00M-Plus R0M-Scripts.sh:**  
*[Chocolate Doom (Plus).sh]:* Can be placed in ..roms/ports/  
A Template Script for use with chocolate-doom-plus  

*[+Chocolate Doom Setup.sh]:* Can be placed in ..roms/ports/  
Single Script to Select chocolate-setup for doom, heretic, hexen, strife  
Also includes Dedicated Server Mode  

## REFERENCES   
***Where to get Chocolate D00M P0RT:***  
[Exarkuniv/RetroPie-Extra/ports/chocolate-doom](https://github.com/Exarkuniv/RetroPie-Extra/blob/master/scriptmodules/ports/chocolate-doom.sh)  

***SOURCES:***  
[Exarkuniv/RetroPie-Extra](https://github.com/Exarkuniv/RetroPie-Extra)  
