# chocolate-doom-plus (chocolate-doom+)  
![chocolate-doom_plus.png](https://raw.githubusercontent.com/RapidEdwin08/chocolate-doom-plus/main/chocolate-doom_plus.png)  
[chocolate-doom+] Emulator Entry allows you to easily load multiple D00M WADs with Chocolate D00M in RetroPie.  

**HOW DOES IT WORK?**  
[chocolate-doom-plus] Simplifies Chocolate D00M with additional Emulator Entries and R0M-Scripts.sh  
When Installed you can specify the Full Path to the doom.wad %ROM% in your Chocolate D00M R0M-Scripts.sh  
Additionally includes R0M-Scripts for Chocolate D00M Setup Selection + Dedicated Server  

## INSTALLATION  
***You MUST INSTALL Chocolate Doom from RetroPie Setup 1st! [chocolate-doom]***  
*eg. from [Exarkuniv/RetroPie-Extra/ports/chocolate-doom](https://github.com/Exarkuniv/RetroPie-Extra/blob/master/scriptmodules/ports/chocolate-doom.sh)  

Can be ran from retropiemenu:  

```bash
wget https://raw.githubusercontent.com/RapidEdwin08/chocolate-doom-plus/main/chocolate-doom_plus.sh -P ~/RetroPie/retropiemenu
wget https://raw.githubusercontent.com/RapidEdwin08/chocolate-doom-plus/main/chocolate-doom_plus.png -P ~/RetroPie/retropiemenu/icons
```

0R Run Manually from any directory:  
```bash
cd ~
git clone --depth 1 https://github.com/RapidEdwin08/chocolate-doom-plus.git
sudo chmod 755 ~/chocolate-doom-plus/chocolate-doom_plus.sh
cd ~/chocolate-doom-plus && ./chocolate-doom_plus.sh

```

0ptionally you can Add an Entry and Icon to your retropiemenu [gamelist.xml]:  
*Example Entry:*  
```
	<game>
		<path>./chocolate-doom_plus.sh</path>
		<name>[chocolate-doom+] Chocolate D00M Plus</name>
		<desc>Configure [chocolate-doom+] for [RetroPie].</desc>
		<image>./icons/chocolate-doom_plus.png</image>
	</game>
```

If you need the Chocolate-D00M-Plus-Template.sh: 
```bash
wget https://raw.githubusercontent.com/RapidEdwin08/chocolate-doom-plus/main/Chocolate\ D00M\ \(Plus\).sh -P ~/RetroPie/roms/ports
```

## REFERENCES   
***Where to get Chocolate D00M P0RT:***  
[Exarkuniv/RetroPie-Extra/ports/chocolate-doom](https://github.com/Exarkuniv/RetroPie-Extra/blob/master/scriptmodules/ports/chocolate-doom.sh)  

***Chocolate-D00M-Plus R0M-Scripts.sh:***  
[+Chocolate Doom Setup+.sh]: Can be placed in ..roms/ports/*  
Script to Select chocolate-setup for doom, heretic, hexen, strife  

[+Chocolate Doom Server+.sh]: Can be placed in ..roms/ports/*  
Script to Start chocolate-doom as a Dedicated Server  

***SOURCES:***  
[Exarkuniv/RetroPie-Extra](https://github.com/Exarkuniv/RetroPie-Extra)  
