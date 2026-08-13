# Chrome & Blood Guide, Player Guide, and UMS Sync

## Goal

Keep the public website, the in-game Chrome & Blood Database guide, and Unified Mod Settings aligned without maintaining the same gameplay instructions in several places.

## Ownership

| Surface | Owns |
|---|---|
| Website Guide | The list's direction, how to open the in-game guide, what it covers, how to open UMS, and where settings are grouped |
| In-game Player Guide | Controls, mechanics, counters, profile-specific rules, and current gameplay guidance |
| Unified Mod Settings | Current profile values, settings discovery, customization, Favorites, Modified, search, and browser groups |
| Website FAQ | Installation, performance, troubleshooting, update safety, Rule 11, and support |

The website does not repeat the in-game guide's hotkey tables or detailed system explanations. The in-game guide can link outward when advice changes outside the game, especially graphics, drivers, tools, installation, and support.

## Website Guide

The current long-form guide becomes a short gateway with these sections:

1. **Your Guide Is In-Game**
   - Explain that Chrome & Blood guidance now lives in the Database.
   - Show how to reach the Database from the pause menu.
   - Use `database.png` as the access image.

2. **What the Database Covers**
   - List the current in-game sections with one short description each:
     - Start Here
     - Controls & Hotkeys
     - UI & Inventory
     - Combat
     - Netrunning
     - Builds, Perks & Cyberware
     - Economy
     - Vehicles & Travel
     - Jobs & The World
     - Profiles & Troubleshooting
   - Use `c&b showcase.png` to show the section browser.
   - Use `highlight comparison.png` to show an opened gameplay entry.

3. **How Chrome & Blood Is Balanced**
   - Explain the direction, not internal settings:
     - Combat stays fast and lethal.
     - Exposed enemies are fragile.
     - Armor is a temporary protection layer with weapon and damage-type counters.
     - Weapon penetration and role matter more than raw rarity.
     - Smarter enemies, specialists, and rising late-game pressure keep the player from outgrowing combat.
     - Strong enemies should create tactical problems without becoming uniform magazine dumps.
   - Do not publish exact health, reduction, penetration-distribution, or level-scaling tables here.

4. **Customize the List with UMS**
   - `Numpad 0` opens Unified Mod Settings.
   - Explain that the included Standard and Immersive profiles carry the intended list settings.
   - Explain Favorites, Modified, search, and the grouped browser briefly.
   - List the ten shared browser categories:
     - Combat, Enemies & Difficulty
     - Weapons & Gunplay
     - Netrunning & Stealth
     - Builds, Perks & Cyberware
     - Economy, Loot & Crafting
     - Vehicles, Travel & Customization
     - World, Quests & Immersion
     - HUD, Accessibility & Controls
     - Inventory & Quality of Life
     - Visuals & Performance
   - Do not list every mod in each group. Group membership differs between Standard and Immersive and can change without altering the public explanation.
   - Tell players to change one system at a time and use Modified to find their changes.

5. **Need Help?**
   - Link the FAQ for troubleshooting and performance.
   - Link Rule 11 before adding, removing, or reordering mods.
   - Link Discord for support after documented checks.

The home page continues to describe the list at a high level. It should link to the revised Guide without duplicating the new sections.

## In-Game Player Guide Audit

Audit both Standard and Immersive JSON files. Preserve profile-specific entries and section order unless current installed behavior contradicts them.

Required corrections already established from the active profiles:

- Rewrite **Damage and Lethality**. All eight enemy tiers currently use the same 45 percent health multiplier. Threat differences come from armor, abilities, AI, equipment, and encounter role rather than tier-specific health values.
- Rewrite **Enemy Armor**. Every segment currently uses the same reduction. Segment count changes how much armor must be broken, not the per-hit reduction. Preserve scanning, penetration, heat, repair, and target-priority guidance only where the installed implementation and enabled settings still support it.
- Rewrite **Cyberware Limits**. Humanity and Humanity - Cyberpsycho Missions are no longer installed. Keep cyberware capacity and slot limits, but remove Humanity as an active budget.
- Recheck **Job Payouts**. Remove the alive-capture payout claim unless an enabled current provider still implements it.
- Rewrite **Reworked Handling** around the active vehicle stack. Cyber Grip and Limited Slip Differential were removed.
- Update provider metadata for renamed or replaced packages such as Much Better Impacts and Virtual Atelier without treating a folder rename as a removed feature.

The audit also checks every entry's provider list against both active MO2 profiles and checks every concrete gameplay claim against the current installed provider or active profile setting.

## Release Key Notes

The release changelog should consider these headlines in this order:

1. Combat and lethality rebuilt around fast kills, armor counterplay, and late-game threat.
2. Enemy segmented armor and player Armor Integrity.
3. Armor penetration normalized across the weapon lineup.
4. The Chrome & Blood in-game Database guide.
5. UMS browser organization and curated settings profiles.
6. Cyberware and vehicle-system cleanup where the final release diff confirms a player-facing change.
7. Visual and performance stack refresh if the formal release diff supports a distinct headline.

Exact mod additions, updates, removals, save compatibility, version number, and final Key Notes come from the modlist changelog workflow. Raw folder-diff counts are not publication-ready because several current entries are replacements, renames, or separators.

## Images

Source images:

- `C:\Users\qcarg\Downloads\database.png`
- `C:\Users\qcarg\Downloads\c&b showcase.png`
- `C:\Users\qcarg\Downloads\highlight comparison.png`

Convert them to web JPEGs under `docs/assets/img/`. Preserve the red annotations, use descriptive filenames, keep the 1920-pixel maximum width, and target 600 KB or less per guide image.

The balance chart from the earlier balance task is not published as an internal settings table. It can be reconsidered only if it is turned into an evergreen player-facing explanation that does not expose values likely to drift.

## Files

Expected implementation surfaces:

- `D:\Chrome-Blood\docs\guide.html`
- `D:\Chrome-Blood\docs\index.html` only if its Guide link or surrounding copy requires adjustment
- `D:\Chrome-Blood\docs\assets\style.css` only for layouts the existing components cannot express
- `D:\Chrome-Blood\docs\assets\img\<guide images>.jpg`
- `D:\Chrome & Blood - Compiled\mods\Modlist Settings - Standard Profile\r6\storages\PlayerGuideFramework\chrome-and-blood.json`
- `D:\Chrome & Blood - Compiled\mods\Modlist Settings - Immersive Profile\r6\storages\PlayerGuideFramework\chrome-and-blood.json`

The existing untracked `D:\Chrome-Blood\Modlist\NexusChangelog-v4.1.md` is outside this task and remains untouched.

## Verification

- Parse both Player Guide JSON files.
- Confirm section IDs, entry IDs, profile-specific entries, and image identifiers remain valid.
- Compare every guide provider reference with both active MO2 profile lists.
- Confirm active combat values used by the revised prose from the current UMS profiles and runtime settings.
- Confirm Standard and Immersive share common corrected entries while preserving intentional profile differences.
- Compress each website image within budget and inspect the result.
- Preview the website locally at desktop and mobile widths.
- Confirm navigation, links, image loading, overflow, console output, reduced-motion behavior, and asset cache stamps.
- Review the final website and Player Guide changes together for contradictions.
- Do not push the public website until the complete cross-surface update passes review.
