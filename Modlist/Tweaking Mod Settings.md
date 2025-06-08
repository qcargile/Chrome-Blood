# ⚙️ Chrome & Blood - Mod Settings Tuning Guide

Welcome to **Chrome & Blood**, my custom Cyberpunk 2077 modlist focused on immersion, enhanced visuals, extended content, and combat realism. This guide is here to help you **tune the mod settings** that matter most — the ones that *will* affect how the game feels, plays, and performs.

Some mods in this list are **highly customizable** and meant to be **tweaked to your liking**. Below you'll find what I recommend checking out and adjusting based on your playstyle, hardware, and taste.

---

## 📚 Table of Contents

- [HUD & Interface](#-hud--interface)
- [Gameplay & Mechanics](#-gameplay--mechanics)
- [Cyberware & Combat](#-cyberware--combat)
- [Visuals & Graphics](#-visuals--graphics)
- [Quality of Life](#-quality-of-life)
- [Frameworks & Utilities](#-frameworks--utilities)
- [Final Tips](#-final-tips)

---

## 🧠 HUD & Interface

### `HUD Painter`
- Used to ** recolor** the HUD.
- Several presets are included for users to choose from. 
- Change your preset using the HUD Painter button on the main menu. After changing presets, you **MUST** restart your game for changes to completely take effect, or you will crash.

### `Preem Scanner`
- Lets you style your scanner with **cleaner visuals** and reduced overlay noise.
- I include a Monochrome Addon that gives a crisp, retro-futuristic look.

---

## 🎮 Gameplay & Mechanics

### `Stealthrunner`
- Expands stealth mechanics with more nuanced detection and behavior.
- Tweak how forgiving stealth is, how alert enemies behave, and how stealth perks scale.
- If you’re playing a Netrunner or Assassin-type build, absolutely dive into the settings.

### `Enemies of Night City`
- These overhaul combat AI and encounter dynamics.
- You can dial up or down enemy aggression, accuracy, and awareness — depending on whether you want chaos or control.

### `They Will Remember`
- Adds a system for **persistent reputation** based on your violent actions.
- You can adjust how quickly people react to your past, or disable it for a cleaner sandbox-style play.

### `Scrapper`
- Automatically scraps tier 1–5 weapons, attachments, clothing, quickhacks, and mods on pickup.
- Incredibly useful for loot-heavy playthroughs, but highly recommended to tweak the settings first so you don’t destroy gear you actually want to use.
- You can exclude specific categories or tiers through the settings panel — don’t skip this if you're running a heavily modified loot economy.

### `Radial Breach`
- Allows you to cast **Breach Protocol in a radial AOE**, affecting all nearby enemies.
- Encourages fast-paced netrunner gameplay with fewer pauses for manual breaches.
- Settings allow radius scaling, RAM cost, and effect duration customization.

### `Enhanced Weakspot - Vulnerability Analytics Tweaks`
- Improves how **weakspots and vulnerability analysis** are detected and rewarded.
- Adds new mechanics to encourage targeting limbs and gear-based vulnerabilities.
- Offers toggles and sliders for scan time, damage bonuses, and enemy responsiveness.

### `Better Netrunning`
- Completely overhauls the netrunning experience with **smoother quickhack flow**, **expanded detection**, and **system-wide balance tweaks**.
- Great for immersive and reactive netrunner builds. Includes toggleable enemy interrupt resistance, hack radius, and access times.
- Highly recommended for players who rely on stealth, hacking, and sensor control.

---

## 🤖 Cyberware & Combat

### `CyberwareEX` 
- I’ve expanded cyberware functionality with this.
- You can enable extra implant slots, adjust restrictions, and customize loadout balance.
- Perfect for people going for full Borg/Edgerunner builds.

### `Wannabe Edgerunner`
- Optional cyberpsychosis system. Super customizable.
- If you want risk to go with power, tweak it to make mental collapse a threat. Or tone it down for more forgiveness.

### `Guns Redone V3`
- Adjusts weapon recoil, spread, damage, and armor interactions.
- Works with vanilla and most custom weapons. Choose presets or fine-tune for your favorite weapon class.

---

## 🌆 Visuals & Graphics

### `LUT Switcher 2`
- Lets you **swap LUTs on the fly** using the CET overlay.
- Hundreds of LUTs available across multiple styles: vibrant, noir, cyberpunk neon, muted realism, etc.
- Perfect for players who want to change the mood of their game without restarting.

### `Improved Distant Shadows`
- Enhances shadow detail and consistency at longer distances.
- Helps maintain immersion, especially in large outdoor areas or when flying/driving.

### Here's a step by step process to get the most out of your graphics with Chrome & Blood post-v1.13 update

1. Navigate to D:\Chrome & Blood\Tools\DLSS Swapper
2. Find and run the DLSS Swapper.exe
3. On the "Games" home page, click on Cyberpunk 2077.
4. Change the DLSS, DLSS Frame Generation, and DLSS Ray Reconstruction .dll to the following versions;
DLSS: 310.2.1
DLSS Frame Generation: 3.8.1
DLSS Ray Reconstruction: 310.2.1
5. It should look like this when youre done:
![image](https://github.com/user-attachments/assets/6761ecd0-9118-47eb-b0bb-bb626bf68f45)

6. If you use FSR instead, follow the instructions on [this mod page](https://www.nexusmods.com/site/mods/738) to setup FSR3 for Cyberpunk 2077.
7. Close DLSS Swapper when complete.

8. Next, navigate to D:\Chrome & Blood\Tools\NVIDIA Profile inspector\NVPI-Revamped
9. Find and run NVIDIA Profile Inspector.exe
10. When that opens, type in "cyberpunk" in the profile search bar, and click on Cyberpunk 2077.
![image](https://github.com/user-attachments/assets/9af5561d-7f46-427f-80ec-9f9d84755d1c)

11. Navigate to DLSS Overrides section, and set the RR:Preset / SR:Preset to "Preset k". **IF YOU EDIT ANY OTHER SETTINGS OUTSIDE THE SCOPE OF THIS GUIDE, I WILL NOT PROVIDE SUPPORT FOR THAT**.
![image](https://github.com/user-attachments/assets/79cc64c4-927c-4ffa-9562-d37451d66fe4)


12. Click "apply changes" in the top right, and close NVIDIA Profile Inspector.

13. That's it! You're ready to play. 
---

## 🧩 Quality of Life

### `Equipment-EX`
- Lets you add custom outfit slots, accessory support, and more.
- If you use the wardrobe or frequently swap builds, check the settings for outfit memory and UI behavior.

### `Immersive Interaction`, `Hangout Romances`, `Immersive Fixers`
- These add world interaction layers and deeper relationship content.
- Configure how often hangouts occur and whether they tie into story beats or stay sandboxed.

---

## 🧰 Frameworks & Utilities

### `Mod Settings` + `Native Settings UI`
- This is where most of the above mods get configured.
- Open from the pause menu or use the side menu extension.
- Highly recommend checking these menus **after every major mod install** — don’t miss useful toggles.

---

## ✅ Final Tips

- **Back up your configs**: Especially CET and NativeSettings tweaks after your first setup session.
- **Test before committing**: Run through Dogtown or Watson to stress-test visuals and combat after tweaks.
- **Be smart with stacking**: Too many overlapping AI/gameplay overhauls can create conflicts — so tweak incrementally.

---

Make it your Night City. This is just the foundation — Chrome & Blood is meant to bend with your build.

Feel free to open an issue or drop feedback if you hit edge cases or balancing quirks. Enjoy the ride, choom. 🦾
