![C B wabba](https://github.com/user-attachments/assets/13d62f0f-0baf-4028-a355-b67508f3d9ae)

>[!IMPORTANT]
>- Chrome & Blood requires the Phantom Liberty DLC.
>- Chrome & Blood is a **NSFW** modlist. Overall gameplay is the main emphasis of this list, however, do not play this infront of your grandma.

>[!WARNING]
>You must update Cyber Punk 2077 to the latest version on Steam to install this list.

## Introduction

Chrome & Blood is a complete Cyberpunk 2077 overhaul built to reforge the game into a darker, grittier, and more immersive experience. Every core system has been reworked—from AI and combat mechanics to stealth, hacking, and progression—creating a more challenging and rewarding sandbox. The visual fidelity is pushed to the limit with upgraded lighting, weather, and textures, while the UI has been completely redesigned for a sleek, diegetic look that feels native to the world. Players can fully customize both male and female V with a huge selection of new cosmetics, cyberware, vehicles, and weapons, giving every playthrough a unique aesthetic. This is more than just a modlist — it's a full-blown reimagining of what Cyberpunk 2077 can be.

Step into Night City like you've never seen it before—raw, ruthless, and dripping in chrome.

Current Mod List: [Chrome & Blood Load Order](https://loadorderlibrary.com/lists/chrome-blood-2) 

Modlist Changelog: [v1.04](https://github.com/qcargile/Chrome-Blood/blob/main/changelog.md)

Detailed look at mods in the list can be found [**HERE**](https://github.com/qcargile/Chrome-Blood/blob/main/Modlist/Load%20Order.md)

## System Requirements

Based on both internal performance testing and user feedback, the section below outlines my *recommended* system specifications for the list. Please keep in mind that every PC is different, and these recommendations are an estimate based on available data and firsthand reports. Individual performance may vary depending on specific hardware and software configurations, as well as other system optimizations. **Troubleshooting & support for hardware related issues will not be provided.**

>[!WARNING]
>- An **OFFICIAL** copy of Cp2077 is required to play the modlist.
>- An SSD is **required** to the play the modlist.
>- Only Windows 10 or 11 operating systems are supported. Other operating systems may work, however **I WILL NOT BE PROVIDING SUPPORT FOR THOSE.**

 ![Apr 12, 2025, 12_24_13 PM](https://github.com/user-attachments/assets/e5d44fd3-275a-4c84-b85e-97678b39d29b)

<Details>
<summary>Detailed Size Requirements</summary>

Base Game and DLC: ~84.6 GB

Downloads Size: ~27.9 GB  

Install Size: ~27.8 GB

**MODLIST TOTAL SIZE: ~56.1 GB**

**OVERALL SIZE REQUIREMENT: ~140 GB**  

</Details>

## Preinstallation

**Screenshots below assume the Steam version of the game.** 
1. [Make a Clean install](https://support.cdprojektred.com/en/cyberpunk/pc/sp-technical/issue/2233/how-do-i-perform-a-clean-install-of-the-game) of Cyberpunk 2077 to a location _outside_ `Program Files`.
2. Install the [Visual C++ Redistributables](https://www.techpowerup.com/download/visual-c-redistributable-runtime-package-all-in-one/)
   - Extract the downloaded archive and run `install_all.bat`
<Details>
<summary>3. Disable steam auto updates!</summary>

1. Right-click the title under your Library, and select "Properties..."
2. In the "UPDATES" tab, change Automatic Updates to "Update only when I launch it"  
3. ONLY launch the game from Mod Organizer 2 from this point on! *You have been warned!*

</Details>
   
4. Make sure you have all DLC installed.
5. Click the link if you dont have [Redmod](https://store.steampowered.com/app/2060310/Cyberpunk_2077_REDmod/)
   ![image](https://github.com/user-attachments/assets/dc727531-5f72-4bb6-aa64-df340b48c1a3)

 ### Ensure your steam installation shows both REDMOD and CP2077 PL as installed!!

## Installation - Install from Nexus mods [HERE](https://www.nexusmods.com/cyberpunk2077/mods/20942?tab=description) until C&B is listed on Wabbajack!!

1. Download [Wabbajack](https://www.wabbajack.org) and place it in a folder away from your Cyberpunk 2077 installation and outside of any protected folders, something like `D:\Wabbajack`
2. Launch Wabbajack and go to "Browse Modlists"
3. Directly under the search bar, filter by "Cyberpunk 2077" to only see lists from CP2077.
3. Tick the "NSFW" and "Non-Featured" filters
4. Search for "Chrome & Blood" if necessary
5. Click on my list coverart, then download and install
5. Set the installation/download directory to something like `D:\Chrome & Blood` & `D:\Chrome & Blood\downloads` again, away from your Cyberpunk 2077 installation and outside of any protected folders. Make sure that the installation directory is on the same drive as Cyberpunk 2077.
6. Click the install button and wait for Wabbajack to complete the installation process
7. Find `ModOrganizer.exe` in the folder you installed the modlist to
8. Click the "Run" button on the top right in MO2 to launch Chrome & Blood


## Post-Installation

### Antivirus Exceptions

>[!WARNING]
>Antivirus programs are notorious for false flagging [MO2's Virtual File System](https://stepmodifications.org/wiki/Guide:Mod_Organizer/Advanced), which can and will cause crashes and other problems. Antivirus programs like BitDefender, Norton, and Webroot are especially aggressive, and you will need to fully remove them from your PC in order to actually launch the game through MO2. It is 2025, Windows Defender and being smart online is more than adequate to protect yourself from malicious software.

If you use Windows Defender, it is advised that you set up an exception for the modlist.

<Details>
<summary>Setting up Windows Defender Exceptions:</summary>

 1. Press the Windows Key.
 2. Type "Windows Defender" in the search bar and select "Windows Security".
 3. Click on "Virus & threat protection" in the left pane.
 4. Click the "Manage settings" option under "Virus & threat protection settings".
 5. Scroll down to "Exclusions" and click "Add or remove exclusions".
 6. Windows Defender will prompt you with a run as administrator screen, just hit yes.
 7. Click the "Add an exclusion" button at the top and choose "Folder".
 8. Navigate to your Install folder for the list and click "Select Folder".
 9. **(OPTIONAL)** You can repeat these steps for the other executables:
    - ModOrganizer.exe (`[Path to Modlist]\ModOrganizer.exe`)
    
</Details>

## Updating

- Follow steps 2-4 from the Installation section above **with the addition of checking the `Overwrite` box before starting installation**.

## 🔑 Keybinds to Know (Modded Controls)

Below is a list of important keybinds added or changed by mods in this list. Some of these may need to be configured in-game or through the unified **Redscript and CET Mods Settings** menu, which combines mod options from both systems into one easy-to-access interface.

### 🧠 Gameplay / Interface
- **Scanner Slowdown (RAM-based)** — *Automatically adjusts* based on remaining RAM, no manual keybind required.
- **Quickhack Hotkeys**  
  - Default: `1` through `0` (or customizable)  
  - Assign specific quickhacks to keys for instant casting without using the scanner. *(Mod: Quickhack Hotkeys)*

- **Toggle Sprint / Walk Mode** — `G` (default)  
  - Changes movement to walk by default and sprint when holding/toggling. *(Mod: Walk by Default 2.0)*

### 🎒 Inventory & UI
- **HUDitor Control Panel** — `Shift + U` (default)  
  - Open the HUD customization interface to move, hide, or resize elements. *(Mod: HUDitor)*

- **Inventory Zoom In/Out** — Mouse Scroll or `+/-` (customizable)  
  - Zoom into gear in your inventory to inspect details. *(Mod: Inventory Zoom)*

- **Wardrobe Courier Request** — `N` (default) or via in-game courier terminal  
  - Calls a delivery of saved outfits using EquipmentEx presets. *(Mod: Wardrobe Courier)*

- **Preem Map Toggle Layers** — Mouse interactions or settings panel  
  - Switch between enhanced map layers and icons. *(Mod: Preem Map)*

### 📸 Camera & Visuals
- **Streamlined HUD Toggle** — Automatic  
  - Streamlines HUD appearance based on context; no manual key needed. *(Mod: Streamlined HUD)*

### 🛠 Configuration Notes
- **Cyber Engine Tweaks Menu** — *Keybind is set by the player* the first time the game is launched with CET installed.

Be sure to check each mod’s page for additional keybinding options or customization tips.

