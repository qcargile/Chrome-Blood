# ❓ Chrome & Blood — Frequently Asked Questions

This page is for updates, troubleshooting, and common technical problems. For controls and gameplay systems, pause the game, open **Database**, select the first category, and use the sections beginning with **C&B**. For settings, press **`Numpad 0`** to open Unified Mod Settings.

---

## 🗄️ Backups & Updates

**Q: Do I need to prepare my save before updating?**

**A:** Read the newest [changelog](https://qcargile.github.io/Chrome-Blood/changelog.html). If a release needs special preparation, the warning will appear directly under its save-compatibility line. If there is no warning, update normally.

**Q: How do I back up my saves and personal settings?**

**A:** Open your Chrome & Blood installation folder, then back up the folder for the profile you use:

- `profiles\Chrome & Blood - Immersive Profile\saves`
- `profiles\Chrome & Blood - Standard Profile\saves`

Settings supplied by the list live in the matching **Chrome and Blood modlist settings** mod. Settings changed by you may also appear in **Overwrite** at the bottom of MO2's left pane.

**Q: My saves are not in MO2's Saves tab.**

**A:** Open the profile drop-down at the top of MO2, select **Manage**, and enable **Use profile-specific Save Games** for the active profile.

**Q: How do I keep mods I added myself between updates?**

**A:** Read [Rule 11](https://qcargile.github.io/Chrome-Blood/mods.html#rule11) before changing the list. It explains the `[NoDelete]` tag, load-order backups, and the limits of support for a modified installation.

---

## 🛠️ Installation & Launch

**Q: Where are the current installation instructions?**

**A:** Use the [Installation page](https://qcargile.github.io/Chrome-Blood/install.html). The setup tool is the shortest route; the complete manual process is available there if you prefer it.

**Q: How should I launch the game?**

**A:** Open `ModOrganizer.exe`, choose the Immersive or Standard profile, and press **Run**. Do not launch Cyberpunk 2077 through Steam or a desktop shortcut.

**Q: The game will not launch or files disappear after installation.**

**A:** Check your antivirus first. Third-party antivirus commonly interferes with MO2's virtual file system, and Windows Defender may quarantine unfamiliar mod files. Add the Chrome & Blood installation folder to its exclusions, reinstall through Wabbajack, and launch through MO2.

**Q: The game still crashes after a clean reinstall.**

**A:** Reproduce it without added mods, then bring the REDscope crash report and what you were doing to the [Discord](https://discord.gg/U65Nhdcns8). That gives support something concrete to trace.

---

## 🎮 Gameplay & Settings

**Q: Where are the controls and explanations for the reworked systems?**

**A:** They are in the in-game Player Guide. Pause, open **Database**, select the first category, then open **C&B - Start Here** or the section for the system you need. The [Player Guide page](https://qcargile.github.io/Chrome-Blood/guide.html) shows the exact path.

**Q: Where did the second mod-settings menu go?**

**A:** [Unified Mod Settings](https://www.nexusmods.com/cyberpunk2077/mods/28308) combines the list's settings into one menu. Press **`Numpad 0`** to open it. Use its categories, search, favorites, or per-mod profiles to find what you need.

**Q: Damage feels too high or too low. What should I change first?**

**A:** Open UMS and start in **COMBAT, ENEMIES & DIFFICULTY**. Change one setting at a time, then test it before adjusting another. The included profiles are balanced around **Very Hard**, but the vanilla difficulty selector still works.

**Q: Quickhacks, armor, time dilation, crafting, or weapon access work differently from vanilla. Is that intended?**

**A:** Usually. Those systems are all reworked by the list. Use the matching **C&B** Database section for the current rules, progression gates, counters, and profile-specific behavior.

---

## 🧠 HUD, World & Inventory

**Q: The Immersive profile is hiding HUD elements.**

**A:** That profile intentionally restricts parts of the HUD through cyberware requirements and contextual visibility. Open **C&B - UI & Inventory** in the Database for the current requirements and controls. Relevant options are under **HUD, ACCESSIBILITY & CONTROLS** in UMS.

**Q: How do I change the UI color theme?**

**A:** Open [HUD Painter](https://www.nexusmods.com/cyberpunk2077/mods/14935) from the main menu, choose a preset, then restart the game so the new palette loads cleanly.

**Q: Loot icons are missing from the minimap or HUD.**

**A:** Check [Muted Markers](https://www.nexusmods.com/cyberpunk2077/mods/1727) under **HUD, ACCESSIBILITY & CONTROLS** in UMS and re-enable the markers you want.

**Q: Regina is not calling about Cyberpsychos or fixer gigs are not appearing.**

**A:** [Immersive Fixers](https://www.nexusmods.com/cyberpunk2077/mods/15460) adds district progression. Complete NCPD activities in that district so the local fixer notices you.

**Q: Where do I buy gear added by the list?**

**A:** Use any computer, open **Net**, then select [Virtual Atelier](https://www.nexusmods.com/cyberpunk2077/mods/2987). The in-game **C&B - Economy** section explains stores, level gates, schematics, and delivery differences between profiles.

**Q: I am drowning in loot.**

**A:** Configure [Scrapper](https://www.nexusmods.com/cyberpunk2077/mods/2687) under **INVENTORY & QUALITY OF LIFE** in UMS. It is disabled by default to prevent accidental scrapping.

---

## 🎨 Graphics & Performance

**Q: How do I change the overall color grade quickly?**

**A:** Open **LUT Switcher** in the CET overlay. You can swap between the included LUT packs in-game without restarting.

**Q: RT or path-traced shadows look wrong.**

**A:** [General Shadows Fixes](https://www.nexusmods.com/cyberpunk2077/mods/20405) includes an RT/PT-specific option. The list leaves it off by default; enable it under **VISUALS & PERFORMANCE** in UMS if you see artifacts.

**Q: Where are the old ENV Tuner controls?**

**A:** ENV Tuner was removed. [Nova Optics](https://www.nexusmods.com/cyberpunk2077/mods/29190) now handles exposure, adaptation, bloom, vignette, lens flare, and chromatic aberration through its CET window. Leave **Enable Mod** checked; the list ships with **Auto** disabled. Do not install ENV Tuner Lite beside it.

**Q: Night City is too dark.**

**A:** Open the CET overlay, go to **Nova Optics → Exposure Overrides**, and adjust **Shadow Boost**.

### ✅ Recommended NVIDIA Setup

1. Open `Tools\DLSS Swapper` inside your Chrome & Blood installation.
2. Run `DLSS Swapper.exe` and select **Cyberpunk 2077**.
3. Set DLSS, Ray Reconstruction, and Frame Generation to `310.7`.
4. Leave each preset on **Default**.
5. Close DLSS Swapper when finished.

<img width="685" height="370" alt="DLSS Swapper settings for Cyberpunk 2077 using 310.7 and Default presets" src="https://qcargile.github.io/Chrome-Blood/assets/img/dlss.png" />

If you force a DLSS preset manually, `K` is the safer choice for Quality, Balanced, and DLAA. `M` may improve Performance mode on newer RTX cards at a frame-rate cost, while `L` is intended for Ultra Performance. Leave Ray Reconstruction on **Default** unless you are testing.

For FSR, follow the instructions on the [DLSS Enabler mod page](https://www.nexusmods.com/site/mods/738).

---
