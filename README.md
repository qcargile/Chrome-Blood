![chrome and blood](https://github.com/user-attachments/assets/51c77680-565a-42ce-895f-51848c845839)

>[!IMPORTANT]
>- Chrome & Blood requires the Phantom Liberty DLC.
>- This list has been updated for official game patch 2.31!

>[!WARNING]
>You must update Cyberpunk 2077 to the latest version on Steam to install this list.

## Table of Contents

- [Introduction](#introduction)
- [System Requirements](#system-requirements)
- [Preinstallation](#preinstallation)
- [Installation](#installation)
- [Post-Installation](#post-installation)
- [Updating the Modlist](#updating-the-modlist)
- [Keybinds to Know](#keybinds-to-know-modded-controls)
- [Known Issues](#known-issues)


## Introduction

**Chrome & Blood** is a full overhaul of *Cyberpunk 2077* for players who want a faster, harder, and more rewarding Night City. Combat, AI, economy, hacking, cyberware, stealth — all of it has been reworked. Builds matter, fights are lethal, and nothing is handed to you.

- **Visuals** pushed with [ReLUX](https://www.nexusmods.com/cyberpunk2077/mods/20808), [Nova City 2](https://www.nexusmods.com/cyberpunk2077/mods/12490), HDR LUTs, and tuned weather/LOD/fog
- **Combat** with faster TTK, smarter AI, faction [reinforcements](https://www.nexusmods.com/cyberpunk2077/mods/21532), and [Enemies of Night City](https://www.nexusmods.com/cyberpunk2077/mods/8467) as the foundation
- **Weapons** rebalanced via [Chrome Ballistics](https://www.nexusmods.com/cyberpunk2077/mods/22819) and [Damage Scaling and Balance](https://www.nexusmods.com/cyberpunk2077/mods/21865) — every archetype is worth building around
- **Cyberware** expanded with [Neuralware - Chipware Expansion](https://www.nexusmods.com/cyberpunk2077/mods/19798) and the [Cyberware Improved](https://www.nexusmods.com/cyberpunk2077/mods/23554) series
- **Perks** expanded through [Merc Protocol](https://www.nexusmods.com/cyberpunk2077/mods/26751) — 18 new perks with unique mechanics built for this list
- **Vehicles** with reworked handling, [Nitrous](https://www.nexusmods.com/cyberpunk2077/mods/20675), and a full garage of lore-friendly cars and bikes
- **Immersion** with [Immersive Fixers](https://www.nexusmods.com/cyberpunk2077/mods/15460), ammo limits, bounty hunting, and better ripperdocs

---

### Choose Your Playstyle

Chrome & Blood has two profiles. Same deadly core, different rules.

#### Immersive Profile
The hardcore option. Stripped down, survival-focused, built around earning everything.
- Darker visuals, needs management, and UI restrictions via [Dark Future](https://www.nexusmods.com/cyberpunk2077/mods/16300)
- HUD elements like the minimap, 3rd person driving, and health bars are locked behind cyberware through [Immersive Cyberware](https://www.nexusmods.com/cyberpunk2077/mods/21916)
- Remaining HUD stays hidden unless the situation calls for it via [Limited HUD](https://www.nexusmods.com/cyberpunk2077/mods/2592)
- In-game deliveries take time instead of being instant with [Virtual Atelier Delivery](https://www.nexusmods.com/cyberpunk2077/mods/21482)

#### Standard Profile
Same reworked combat and systems, just without the survival layer.
- Full UI and inventory access from the start
- No cyberpsychosis or humanity system
- No needs or HUD restrictions

#### Cosmetics
As of v3.2, cosmetic mods have been pulled from both profiles. Chrome & Blood is purely gameplay now — add whatever cosmetics you want on top. Use the `[NoDelete]` tag in MO2 to keep your additions safe across updates.

---

### Links

- **Current Modlist**: [Chrome & Blood Load Order](https://loadorderlibrary.com/lists/chrome-blood-2)
- **Changelog**: [v3.30](https://github.com/qcargile/Chrome-Blood/blob/main/changelog.md)
- **Discord**: [Chrome & Blood Community](https://discord.gg/U65Nhdcns8)
- **FAQ**: [Here](https://github.com/qcargile/Chrome-Blood/blob/main/Modlist/FAQ.md)


## System Requirements

Based on internal testing and community feedback. Your mileage will vary depending on hardware, background programs, and drivers.

> [!WARNING]
> - You need an **official** copy of *Cyberpunk 2077*.
> - An **SSD is required** — do not try to run this on an HDD.
> - Only **Windows 10/11** is supported. I **will not** provide support for other operating systems.

![system requirements](https://github.com/user-attachments/assets/ba13e4bc-71b5-4379-9e36-b2640c552c05)

<details>
<summary><strong>Size Breakdown</strong></summary>

- **Base Game + DLC:** ~84.6 GB
- **Modlist Downloads:** ~11 GB
- **Modlist Install Size:** ~9.6 GB

**Modlist Total:** ~21 GB
**Overall Space Required:** ~105 GB

</details>

## Preinstallation

> Screenshots and instructions below assume you're using the **Steam version**.

1. [Perform a clean install](https://support.cdprojektred.com/en/cyberpunk/pc/sp-technical/issue/2233/how-do-i-perform-a-clean-install-of-the-game) of *Cyberpunk 2077* — install it **outside** of `Program Files`.

2. Install the [Visual C++ Redistributables (All-in-One)](https://www.techpowerup.com/download/visual-c-redistributable-runtime-package-all-in-one/) — extract and run `install_all.bat`.

3. Disable Steam auto-updates:
   <details>
   <summary>How to disable auto-updates</summary>

   1. Right-click *Cyberpunk 2077* in your Steam Library > **Properties**
   2. Go to the **Updates** tab
   3. Set Automatic Updates to **"Only update this game when I launch it"**
   4. From now on, **only launch the game through Mod Organizer 2**.

   </details>

4. Make sure **all official DLC** is installed.

5. Install [REDmod](https://store.steampowered.com/app/2060310/Cyberpunk_2077_REDmod/) if you haven't already.
   ![image](https://github.com/user-attachments/assets/dc727531-5f72-4bb6-aa64-df340b48c1a3)

6. Update your GPU drivers — [NVIDIA App](https://www.nvidia.com/en-us/software/nvidia-app/) or [AMD Adrenalin](https://www.amd.com/en/support/download/drivers.html).

7. Install [.NET Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/9.0) (latest version).

8. Install [DirectX End-User Runtime](https://www.microsoft.com/en-us/download/details.aspx?id=35).

---

**Before moving on**, make sure Steam shows both **Cyberpunk 2077: REDmod** and **Cyberpunk 2077: Phantom Liberty** as installed.


## Installation

You can install Chrome & Blood from [**Nexus Mods**](https://www.nexusmods.com/cyberpunk2077/mods/20942?tab=description) or from the [**Wabbajack Gallery**](https://www.wabbajack.org/gallery?selectedGame=Cyberpunk%202077&nsfw=true&showUnofficial=true).

---

### Wabbajack Installation

1. **Download [Wabbajack](https://www.wabbajack.org)** and put it somewhere safe — not inside your Cyberpunk folder and not in a protected location like Program Files.
   > Example: `D:\Wabbajack`

2. Launch **Wabbajack** and go to **Browse Modlists**.

3. Filter by **Cyberpunk 2077** and tick **Non-Featured**.

4. Search for **Chrome & Blood** if it doesn't show up right away.

5. Click the cover art, then download and install.

6. Set your paths:
   - **Installation:** `D:\Wabbajack\Chrome & Blood`
   - **Downloads:** `D:\Wabbajack\downloads` or `D:\Wabbajack\Chrome & Blood\downloads`

   Using a shared downloads folder lets different Wabbajack lists reuse the same archives.

   > ⚠️ Both folders need to be on the **same drive** as your Cyberpunk install, and **not** inside the game directory or Program Files.

7. Hit **Install** and let Wabbajack do its thing.

8. Once it's done, open the install folder and launch `ModOrganizer.exe`.

9. In MO2, make sure the profile is set to **Chrome & Blood**, then hit **Run** in the top right.


## Post-Installation

### Antivirus

> [!WARNING]
> Antivirus software (especially BitDefender, Norton, Webroot) will cause problems with [MO2's Virtual File System](https://stepmodifications.org/wiki/Guide:Mod_Organizer/Advanced). You may need to fully remove third-party antivirus for this list to work. Windows Defender with smart browsing habits is enough.

If you're using Windows Defender, add folder exclusions:

<details>
<summary>How to add a Windows Defender exception</summary>

1. Open **Windows Security**
2. Go to **Virus & threat protection**
3. Click **Manage settings**
4. Scroll to **Exclusions** > **Add or remove exclusions**
5. Add your Chrome & Blood installation folder
6. (Optional) Also exclude `ModOrganizer.exe` and `Cyberpunk2077.exe`

</details>

Also disable any overlays — Steam overlay, Discord overlay, GPU software overlays, Xbox Game Bar, etc.

---

## Updating the Modlist

1. Download the latest `.wabbajack` file (or find the updated listing in the Wabbajack gallery).
2. Follow the installation steps above starting from step 2.
3. **Check the `Overwrite` box** before installing so updated files get replaced properly.


## Keybinds to Know (Modded Controls)

Some of these can be changed in-game or through the **Redscript and CET Mod Settings** menu.

### Gameplay / Interface

| Key | Action | Mod |
|---|---|---|
| `1` – `0` | Quickhack hotkeys — assign quickhacks to keys for instant casting without the scanner | Quickhack Hotkeys |
| `O` | Immersive timeskip menu | Immersive Timeskip |
| `Left Shift` (vehicles) / `Spacebar` (bikes) | Nitrous boost | Nitrous |
| `Hold Shift` while ADS | Variable zoom on supported scopes | Zoomable Scopes |
| `DPad Left Hold` (controller) / `Mouse 5` (KB) | Toggle flashlight | Simple Flashlight |
| `F3` | Night vision (requires Kiroshi Optics) | Kiroshi Optics Night Vision |
| `T` | Cycle firing modes (single/burst/auto) | Trigger Mode Control |

The **Cyber Engine Tweaks** keybind is set by you the first time you launch with CET installed.

Check each mod's page for additional keybind options.

---

## Known Issues

### CTD When Selecting Clothing in Virtual Atelier
**Mods:** Virtual Atelier + Gender-Locked Clothing Mods

Selecting clothing meant for the opposite gender in any Virtual Atelier store will crash the game. Some clothing mods aren't set up for both body types.

**Workaround:** Don't select items that aren't for your character's body type. If the preview looks like Picture 1 below, it'll crash. Picture 2 is what a compatible item looks like.

#### 1
<img width="825" height="362" alt="image" src="https://github.com/user-attachments/assets/e7f94cce-95f0-4c4a-ac2d-532d288f9703" />

#### 2
<img width="702" height="265" alt="image" src="https://github.com/user-attachments/assets/fe775a6f-9eaf-48ec-9279-0c718719c288" />
