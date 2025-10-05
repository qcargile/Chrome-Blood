# ❓ Chrome & Blood — Frequently Asked Questions (FAQ)

If you’re here for visuals/performance, jump to **[Graphics & Performance](#graphics--performance)** — it includes the full step-by-step setup.

---

## 📚 Table of Contents

- [Gameplay](#gameplay)
- [HUD & UI](#hud--ui)
- [Progression & Crafting](#progression--crafting)
- [World & Content](#world--content)
- [Inventory & QoL](#inventory--qol)
- [Graphics & Performance](#graphics--performance)
- [Final Tips](#final-tips)

---

## 🎮 Gameplay

**Q: Damage feels undertuned or overtuned. How can I adjust it?**  
**A:** In **Mod Settings**, tune either:
- **[Dmg. Scaling](https://www.nexusmods.com/cyberpunk2077/mods/21865)** (broad player damage scaling), or  
- **[ENC](https://www.nexusmods.com/cyberpunk2077/mods/8467?tab=description)** (encounter scaling & pacing).  
Adjust gradually, test in Watson/Dogtown, then fine-tune.

**Q: Why can’t I quickhack enemies right away?**  
**A:** The list uses **[Better Netrunning](https://www.nexusmods.com/cyberpunk2077/mods/2302)**. You must either:
- Knock a target **unconscious** and breach their network directly, or  
- Breach via an **access point**.  
Higher **Cyberdeck** tiers and **INT** unlock higher quickhack tiers, returning toward vanilla access as you progress.

---

## 🧠 HUD & UI

### `HUD Painter`
- Used to **recolor** the HUD.
- Several presets are included for users to choose from.
- Change your preset using the HUD Painter button on the main menu. After changing presets, you **MUST** restart your game for changes to completely take effect, or you will crash.

**Q: On the *Immersive* profile my HUD is missing — why?**  
**A:** Two mods hide/lock HUD elements:
- **[Immersive Cyberware](https://www.nexusmods.com/cyberpunk2077/mods/21916)**: gates HUD behind cyberware requirements.  
- **[Limited HUD](https://www.nexusmods.com/cyberpunk2077/mods/2592)**: hides most widgets until context triggers.  
Install/upgrade the appropriate cyberware or adjust each mod’s settings.

**Q: How do I change the game’s UI color theme?**  
**A:** Use **[HUD Painter](https://www.nexusmods.com/cyberpunk2077/mods/14935?tab=description)** from the **main menu** to pick a preset.  
After changing presets, **restart the game** to avoid crashes and ensure the palette fully applies.

**Q: My minimap is missing icons.**  
**A:** That’s **[Muted Markers](https://www.nexusmods.com/cyberpunk2077/mods/1727)**. Re-enable specific markers in its in-game settings.

---

## 🛠️ Progression & Crafting

**Q: Why can’t I craft like vanilla?**  
**A:** **[Immersive Crafting](https://www.nexusmods.com/cyberpunk2077/mods/16154)** requires crafting at a **stash** until you unlock the relevant **perk**. You can loosen this in the mod’s settings.

---

## 🗺️ World & Content

**Q: Regina isn’t calling about Cyberpsychos; fixer gigs aren’t spawning.**  
**A:** **[Immersive Fixers](https://www.nexusmods.com/cyberpunk2077/mods/15460)** adds criteria for fixer calls and gigs. Complete **NCPD activities in the district** so the local fixer “notices” you.

**Q: Where do I buy the new weapons/clothes added by the list?**  
**A:** On any computer → **Net** → **[Virtual Atelier](https://www.nexusmods.com/cyberpunk2077/mods/2987)** icon. Browse the added stores there.

---

## 🎒 Inventory & QoL

**Q: I’m drowning in loot — how do I manage it?**  
**A:** Configure **[Scrapper](https://www.nexusmods.com/cyberpunk2077/mods/2687)** to auto-scrap by **tier/category**.  
It’s **disabled by default** to prevent accidental scrapping. Set exclusions first, then enable.

---

## 🎨 Graphics & Performance

**Q: How do I change the overall color tone/grade of the game quickly?**  
**A:** Use **[LUT Switcher 2](https://www.nexusmods.com/cyberpunk2077/mods/16310)** in the **CET overlay**. There are hundreds of LUTs (vibrant/noir/realistic/neon). Swap in-game without restarts.

**Q: I’m using RT/PT and shadows look off.**  
**A:** **[General Shadows Fixes](https://www.nexusmods.com/cyberpunk2077/mods/20405)** includes an **RT/PT-specific** toggle.  
The list defaults this **off**. Enable/tune it in Mod Settings if you’re seeing artifacts.

### ✅ Step-by-Step: Maximize Visuals with Chrome & Blood (post-v1.13)

> Follow these exactly. If you change settings outside this scope, support **won’t** be provided for those changes.

1. Navigate to `D:\Chrome & Blood\Tools\DLSS Swapper`  
2. Run `DLSS Swapper.exe`  
3. On the **Games** home page, click **Cyberpunk 2077**.  
4. Change the DLSS DLLs to the following versions:  
   - **DLSS:** `310.2.1`  
   - **DLSS Frame Generation:** `3.8.1`  
   - **DLSS Ray Reconstruction:** `310.2.1`  
5. It should look like this when you’re done:  
   ![image](https://github.com/user-attachments/assets/6761ecd0-9118-47eb-b0bb-bb626bf68f45)  
6. If you use **FSR** instead, follow the instructions on **[this mod page](https://www.nexusmods.com/site/mods/738)** to set up FSR3 for Cyberpunk 2077.  
7. Close **DLSS Swapper** when complete.  
8. Next, navigate to `D:\Chrome & Blood\Tools\NVIDIA Profile inspector\NVPI-Revamped`  
9. Run `NVIDIA Profile Inspector.exe`  
10. In the profile search bar, type **“cyberpunk”**, then click **Cyberpunk 2077**.  
    ![image](https://github.com/user-attachments/assets/9af5561d-7f46-427f-80ec-9f9d84755d1c)  
11. Go to **DLSS Overrides** and set **RR:Preset / SR:Preset** to **Preset k**.  
    **IF YOU EDIT ANY OTHER SETTINGS OUTSIDE THE SCOPE OF THIS GUIDE, I WILL NOT PROVIDE SUPPORT FOR THAT.**  
    ![image](https://github.com/user-attachments/assets/79cc64c4-927c-4ffa-9562-d37451d66fe4)  
12. Click **Apply changes** (top right), then close **NVIDIA Profile Inspector**.  
13. That’s it — you’re ready to play.

---

## ✅ Final Tips

- **Back up your configs**: Especially CET and NativeSettings tweaks after your first setup session.  
- **Test before committing**: Run through Dogtown or Watson to stress-test visuals and combat after tweaks.  
- **Be smart with stacking**: Too many overlapping AI/gameplay overhauls can create conflicts — tweak incrementally.
