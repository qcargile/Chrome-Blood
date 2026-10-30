# ❓ Chrome & Blood — Frequently Asked Questions

Help with installation, updates, and common problems. For controls and gameplay, use the [in-game Player Guide](https://qcargile.github.io/Chrome-Blood/guide.html). **Numpad 0** opens mod settings.

---

## 📚 Table of Contents

- [Backups & Updates](#backups-updates)
- [Installation & Launch](#installation-launch)
- [Gameplay & Settings](#gameplay-settings)
- [HUD, World & Inventory](#hud-world-inventory)
- [Graphics & Performance](#graphics-performance)

---

## 🗄️ Backups & Updates

**Q: Do I need to prepare my save before updating?**

**A:** 5.0 supports existing saves; a new game is recommended. Back up saves and personal settings first. The Immersive profile has been retired; select **Chrome & Blood - Standard Profile** after updating. Check the [changelog](https://qcargile.github.io/Chrome-Blood/changelog.html) for any update-specific instructions.

**Q: How do I back up my saves and personal settings?**

**A:** Open your Chrome & Blood installation folder, then back up your Standard profile saves:

- `profiles\Chrome & Blood - Standard Profile\saves`

If you previously used Immersive, also preserve `profiles\Chrome & Blood - Immersive Profile\saves`. After updating, copy the backed-up save folders you want to continue into Standard's saves folder. Keep the backups and do not overwrite same-named Standard saves. If profile-specific saves were disabled, back up `%USERPROFILE%\Saved Games\CD Projekt Red\Cyberpunk 2077` instead.

Settings supplied by the list live in the matching **Chrome and Blood modlist settings** mod. Settings changed by you may also appear in **Overwrite** at the bottom of MO2's left pane.

When backing up Much Better Contracts, preserve its `settings.json` and all `contract-*.log` files in its CET folder, including copies in Overwrite. Those files hold assignment history and recovery state; they are not disposable diagnostic logs.

**Q: My saves are not in MO2's Saves tab.**

**A:** Open the profile drop-down at the top of MO2, select **Manage**, and enable **Use profile-specific Save Games** for the active profile.

**Q: How do I send a save for troubleshooting?**

**A:** Open the **Saves** tab on the right side of MO2. Hover over the saves to identify the one you need, then right-click it and select **Open in Explorer**. Select every file in that save folder, create a ZIP or archive, and send the archive.

**Q: How do I keep mods I added myself between updates?**

**A:** Read [Rule 11](https://qcargile.github.io/Chrome-Blood/mods.html#rule11) before changing the list. It explains the `[NoDelete]` tag, load-order backups, and the limits of support for a modified installation.

---

## 🛠️ Installation & Launch

**Q: Where are the current installation instructions?**

**A:** Use the [Installation page](https://qcargile.github.io/Chrome-Blood/install.html). The setup tool is the shortest route; the complete manual process is available there if you prefer it.

**Q: How should I launch the game?**

**A:** Open `ModOrganizer.exe`, select **Chrome & Blood - Standard Profile**, and press **Run**. Do not launch Cyberpunk 2077 through Steam or a desktop shortcut.

**Q: What is the Archives Load Order tab?**

**A:** It controls legacy archive priority for the selected profile. Higher archives win. This is separate from the left-pane mod order; REDmod entries are read-only. Keep the curated order for the supported list. Colors show resource overlap, not a compatibility verdict. Choose **Save order** after making changes.

**Q: Does the update notification update my mods automatically?**

**A:** No. It checks for a newer C&B list version and offers to open Wabbajack. **Don't show this version again** dismisses that version only. Close MO2 and the game before installing the update.

**Q: The game will not launch or files disappear after installation.**

**A:** Check your antivirus first. Third-party antivirus commonly interferes with MO2's virtual file system, and Windows Defender may quarantine unfamiliar mod files. Add the Chrome & Blood installation folder to its exclusions, reinstall through Wabbajack, and launch through MO2.

**Q: I just crashed. What should I send for help?**

**A:** Open the Chrome & Blood installation directory you chose during setup, then go to `overwrite\red4ext\plugins\REDscope\crashes`. For example, if the list is installed under `D:\XXXXXX`, the full path is `D:\XXXXXX\overwrite\red4ext\plugins\REDscope\crashes`.

Find the folder for the crash you want analyzed, zip the entire folder, and send that archive with a short description of what you were doing when the crash happened. Do not send only one file from the folder.

**Q: The game still crashes after a clean reinstall.**

**A:** Reproduce it without added mods, then follow the crash-report steps above. Include what you were doing when it crashed when you post the archive in the [Discord](https://discord.gg/U65Nhdcns8).

---

## 🎮 Gameplay & Settings

**Q: Where are the controls and explanations for the reworked systems?**

**A:** They are in the in-game Player Guide. Press **`H`** to open the Character menu, select **Database**, choose the first category, then open **C&B - Start Here** or the section for the system you need. The [Player Guide page](https://qcargile.github.io/Chrome-Blood/guide.html) shows the exact path.

**Q: Where did the second mod-settings menu go?**

**A:** [Unified Mod Settings](https://www.nexusmods.com/cyberpunk2077/mods/28308) combines the list's settings into one menu. Press **`Numpad 0`** to open it. Use its categories, search, favorites, or per-mod profiles to find what you need.

**Q: Damage feels too high or too low. What should I change first?**

**A:** Open UMS and start in **COMBAT, ENEMIES & DIFFICULTY**. Change one setting at a time, then test it before adjusting another. The Standard profile is balanced around **Very Hard**, but the vanilla difficulty selector still works.

**Q: Quickhacks, armor, time dilation, crafting, or weapon access work differently from vanilla. Is that intended?**

**A:** Usually. The list changes those systems. The matching **C&B** Database section explains how they work.

---

## 🧠 HUD, World & Inventory

**Q: My crosshair does not recenter after firing.**

**A:** Recoil recovery is disabled for both hip fire and aiming down sights. Control the climb yourself; aiming reduces recoil to 70%. Change Weapon Handling Control in UMS if you want different behavior.

**Q: Can I filter saves by lifepath or save type?**

**A:** Those filters are no longer included. Named Saves still lets you label manual saves and search those labels on the load screen.

**Q: Which optional mods are included but disabled?**

**A:** Dark Future Core, Ultra+, World Builder, General Shadows Fixes, Draw Distance ReImagined, and ReImagined remain available in MO2. They are not enabled by default. The graphical mods are temporarily disabled while we wait for their Cyberpunk 2.5 updates. Dark Future Core and World Builder remain optional. The guide describes the default setup.

**Q: Why is the HUD hidden?**

**A:** Limited HUD is enabled by default in Standard. It hides elements contextually; no special implant is required. Relevant options are under **HUD, ACCESSIBILITY & CONTROLS** in UMS. Dark Future Core is an optional module and disabled by default.

**Q: How do I change the UI color theme?**

**A:** Open [HUD Painter](https://www.nexusmods.com/cyberpunk2077/mods/14935) from the main menu, choose a preset, then restart the game so the new palette loads cleanly.

**Q: Loot icons are missing from the minimap or HUD.**

**A:** Check [Muted Markers](https://www.nexusmods.com/cyberpunk2077/mods/1727) under **HUD, ACCESSIBILITY & CONTROLS** in UMS and re-enable the markers you want.

**Q: Regina is not calling about Cyberpsychos or fixer gigs are not appearing.**

**A:** [Immersive Fixers](https://www.nexusmods.com/cyberpunk2077/mods/15460) adds district progression. Complete NCPD activities in that district so the local fixer notices you.

**Q: Where do I buy gear added by the list?**

**A:** Visit **gunsmiths and melee vendors** for Chrome Ballistics weapons, attachments, and schematics. Stock varies by shop; weapon and schematic tiers unlock at character levels **1, 8, 18, 28, and 40**. Virtual Atelier and Sabbath are no longer included. Added vehicles are still sold through **Virtual Car Dealer** on apartment computers. The in-game **C&B - Economy** section explains the current rules.

**Q: Added weapons are missing from a shop after updating.**

**A:** A shop you already visited can retain its existing stock until its normal restock. Leave it and allow in-game time to pass before checking again. Stock also depends on the shop and your character level; the Database guide explains the tier gates.

**Q: I am drowning in loot.**

**A:** Open **Scrapper** under **ECONOMY, LOOT & CRAFTING** in UMS. Automatic dismantling is disabled by default. Review the categories before turning it on.

---

## 🎨 Graphics & Performance

**Q: How do I change the overall color grade quickly?**

**A:** Open **LUT Switcher** in the CET overlay. You can swap between the included LUT packs in-game without restarting.

**Q: RT or path-traced shadows look wrong.**

**A:** [General Shadows Fixes](https://www.nexusmods.com/cyberpunk2077/mods/20405) includes an RT/PT-specific option. The list leaves it off by default; enable it under **VISUALS & PERFORMANCE** in UMS if you see artifacts.

**Q: Where are the old ENV Tuner controls?**

**A:** ENV Tuner was removed. [Nova Optics](https://www.nexusmods.com/cyberpunk2077/mods/29190) now handles exposure, adaptation, bloom, vignette, lens flare, and chromatic aberration through its CET window. Leave **Enable Mod** checked; the list ships with **Auto** disabled. Do not install ENV Tuner Lite beside it.

**Q: Night City is too dark.**

**A:** Use the option that fits the situation:

- Press **`Mouse 4`** or **`Square`** to toggle the flashlight in dark interiors.
- With **Tier 3 or higher Kiroshi optics**, press **`F3`** or **`F10`** to cycle Off, Night Vision, and the selected Thermal mode. **Left Shift + F10** changes Thermal modes.
- If the whole image is too dark, open the CET overlay, go to **Nova Optics → Exposure Overrides**, and adjust **Shadow Boost**.

### ✅ DLSS Swapper

1. Open `Tools\DLSS Swapper` inside your Chrome & Blood installation.
2. Run `DLSS Swapper.exe` and select **Cyberpunk 2077**.
3. Review the installed DLSS, Ray Reconstruction, and Frame Generation components. Choose the versions and presets you want to use.
4. Close DLSS Swapper when finished.

For FSR, follow the instructions on the [DLSS Enabler mod page](https://www.nexusmods.com/site/mods/738).

---
