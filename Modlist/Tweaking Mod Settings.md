# ⚙️ Chrome & Blood - Mod Settings Tuning Guide

Welcome to **Chrome & Blood**, my custom Cyberpunk 2077 modlist focused on immersion, enhanced visuals, extended content, and combat realism. This guide is here to help you **tune the mod settings** that matter most — the ones that *will* affect how the game feels, plays, and performs.

Some mods in this list are **highly customizable** and meant to be **tweaked to your liking**. Below you'll find what I recommend checking out and adjusting based on your playstyle, hardware, and taste.

---

## 📚 Table of Contents

- [HUD & Interface](#-hud--interface)
- [Gameplay & Mechanics](#-gameplay--mechanics)
- [Cyberware & Combat](#-cyberware--combat)
- [Vehicles & Driving](#-vehicles--driving)
- [Visuals & Graphics](#-visuals--graphics)
- [Quality of Life](#-quality-of-life)
- [Frameworks & Utilities](#-frameworks--utilities)
- [Final Tips](#-final-tips)

---

## 🧠 HUD & Interface

### `HUDitor` & `HUD Painter`
- Used to **reposition, recolor, and declutter** the HUD.
- I recommend using these to achieve either a minimal HUD look or a classic cyber-UI vibe — up to you.
- Launch via CET overlay or Native Settings menu.

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

## 🚗 Vehicles & Driving

### `Gripped Up`
- Core mod for improving driving physics and realism.
- Also tunes traction and control.

### `Auto Drive` (and addons)
- If you want hands-off travel, you can ride passenger or have your car drive itself.
- Optional detours, cinematic paths, and delay settings can be tweaked.

---

## 🌆 Visuals & Graphics

### `ReLUX`, `Nova LUT`, `Ultra Fog`, `Preem Water`
- These overhaul lighting, fog density, weather, and water effects.
- You *will* want to experiment to find your preferred LUT or reduce fog if you're seeing frame drops.
- Tweak visual style between hyperreal, noir, or neon as you see fit.

### `FX Begone`, `ReFlash`, `ReGlass`
- Removes intrusive effects like vignette, chromatic aberration, inventory blur, and holocall noise.
- Adjust to reduce eye strain or go full cinematic.

### `Ultra Plus - Best Performance and Visuals for Everyone`
- This mod is **vital for fine-tuning performance and graphics quality** across a wide range of hardware.
- It provides a **complete engine-level visual optimization suite**, with massive improvements to how the game handles lighting, memory, frame timing, and ray tracing — all without sacrificing style.
- There are **four distinct presets** included: `Fast`, `Medium`, `High`, and `Insane`, each carefully balanced for a specific type of player or hardware configuration.
- You can **switch presets and tweak advanced settings** at any time through the **CET (Cyber Engine Tweaks) overlay**, making it extremely easy to adjust performance on the fly.
#### 🎛️ Preset Comparison Chart

| Preset | Description | Target Hardware | Performance | Visual Quality |
|--------|-------------|------------------|-------------|----------------|
| **Fast** | "As fast as possible while still looking good" | Mid-range and laptops | 🚀 **+30-40% faster** than vanilla | 👍 Near-vanilla with better consistency |
| **Medium** | "The full mod — perfect balance" | Mid-high range GPUs (3060–4070) | ⚖️ Similar to vanilla | 🌆 Significantly improved |
| **High** | "Give me more visuals, but respect FPS" | 3080+ / 7800+ GPUs | 🔧 Slight drop from vanilla | 🔥 Max fidelity with smart trade-offs |
| **Insane** | "Do it 😎" | RTX 4090 / bleeding edge builds | 🎯 60–80+ FPS on ultra rigs | 💎 Highest possible RT/PT visuals, minimal noise |

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

11. Navigate to DLSS Overrides section, and set the RR:Preset, to "Preset E". **IF YOU EDIT ANY OTHER SETTINGS OUTSIDE THE SCOPE OF THIS GUIDE, I WILL NOT PROVIDE SUPPORT FOR THAT**.
![image](https://github.com/user-attachments/assets/1acc7e43-950a-4000-8a54-c31e82f6f434)

12. Click "apply changes" in the top right, and close NVIDIA Profile Inspector.


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
