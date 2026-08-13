# Cross-Surface Release Update Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Align the Chrome & Blood website, in-game Player Guide, UMS navigation explanation, Nexus collection description, and Nexus revision changelog with the current modlist and balance model.

**Architecture:** The active MO2 profiles and their settings are the mechanical source of truth. The in-game Player Guide owns detailed gameplay instructions, while the website and Nexus collection description route players to it and explain the list at a higher level. Release facts come from the v4.1 snapshot-to-current diff and feed both the website changelog and Nexus revision changelog.

**Tech Stack:** Static HTML/CSS, JPEG assets, Player Guide Framework JSON, UMS profile JSON, PowerShell release tooling, GitHub Pages, Nexus Markdown.

**Spec:** `D:\Chrome-Blood\design\2026-08-13-guide-player-guide-ums-sync.md`

## Global Constraints

- Preserve the existing untracked `D:\Chrome-Blood\Modlist\NexusChangelog-v4.1.md` without modification.
- `D:\Chrome-Blood\docs` is the live GitHub Pages root; a push to `main` publishes the website.
- The website does not repeat detailed controls or mechanic instructions from the in-game Database.
- The Nexus collection description is a gateway and feature overview, not a second Player Guide.
- UMS category names can be published; individual group membership stays out of public prose because Standard and Immersive differ.
- Do not infer the release version, date, save compatibility, or update warning.
- Nexus revision changelogs use ordinary Markdown, `***` separators, and the attached v4.1 hard-line-break style. No `<details>`, `<summary>`, or BBCode.
- No Nexus editor escape output such as `\##`, `\*`, or `&#x20;` enters maintained files.
- Keep the three new website images at 1920 pixels wide or less and 600 KB or less each.
- Do not select a Nexus **Update** or publication control. Quentin owns the final Nexus submission.
- Stage exact task-owned paths only.

---

### Task 1: Capture the Release Truth

**Files:**
- Read: `D:\Chrome & Blood - Changelogs\snapshots\2026-07-11_213616_release-v4.1.json`
- Read/Write: `D:\Chrome & Blood - Changelogs\releases\changelog-published.md`
- Create: the timestamped `pre-release` snapshot path reported by `snapshot.ps1`
- Create: the paired Markdown and JSON report paths reported by `changes.ps1`

**Interfaces:**
- Consumes: Current Standard and Immersive MO2 profiles, settings-profile parity baseline, compatibility-override baseline, and published v4.1 changelog.
- Produces: An exact scoped additions/updates/removals report and a reviewed list of replacement/rename pairs for Tasks 2, 4, and 5.

- [ ] **Step 1: Verify settings-profile parity without changing files**

```powershell
& 'D:\Chrome & Blood - Changelogs\tools\sync-settings-profiles.ps1'
if ($LASTEXITCODE -ne 0) { throw 'Settings profile parity dry-run failed.' }
```

Expected: zero conflicts. Record the proposed change count.

- [ ] **Step 2: Apply parity and prove idempotence when the dry run reports changes**

```powershell
& 'D:\Chrome & Blood - Changelogs\tools\sync-settings-profiles.ps1' -Apply
if ($LASTEXITCODE -ne 0) { throw 'Settings profile parity apply failed.' }
& 'D:\Chrome & Blood - Changelogs\tools\sync-settings-profiles.ps1'
if ($LASTEXITCODE -ne 0) { throw 'Settings profile parity verification failed.' }
```

Expected: the verification reports `0 changes` and `0 conflicts`.

- [ ] **Step 3: Audit collection-owned compatibility overrides**

```powershell
& 'D:\Chrome & Blood - Changelogs\tools\compatibility-audit.ps1'
if ($LASTEXITCODE -ne 0) { throw 'Compatibility override review required.' }
```

Expected: pass. If it names a changed provider or patch, read both profile patches and the upstream provider before updating the baseline.

- [ ] **Step 4: Refresh the published mirror and capture current state**

```powershell
gh api -H 'Accept: application/vnd.github.raw' repos/qcargile/Chrome-Blood/contents/changelog.md > 'D:\Chrome & Blood - Changelogs\releases\changelog-published.md'
& 'D:\Chrome & Blood - Changelogs\tools\snapshot.ps1' -Label 'pre-release'
if ($LASTEXITCODE -ne 0) { throw 'Pre-release snapshot failed.' }
```

Expected: v4.1 remains the newest published release. Stop if either profile is reported stale and have Quentin open that profile once in MO2 before rerunning.

- [ ] **Step 5: Generate the exact v4.1-to-current diff**

```powershell
& 'D:\Chrome & Blood - Changelogs\tools\changes.ps1'
if ($LASTEXITCODE -ne 0) { throw 'Release diff failed.' }
```

Expected: the tool auto-selects `2026-07-11_213616_release-v4.1.json` and writes matching Markdown and JSON reports.

- [ ] **Step 6: Review replacements and false additions/removals**

Cross-check the report against both active `modlist.txt` files and the published v4.1 block. Classify at least these known pairs correctly:

```text
Virtual Atelier -> Virtual Atelier 1.6.2
Much Better Impacts -> Much Better Impacts (melee hitstop)
LUT Switcher 2 plus old pack folders -> LUT Switcher - Core plus current pack folders
```

Expected: separators are excluded, replacements are not presented as unrelated removal/addition pairs, and every reported profile scope matches current enabled state.

---

### Task 2: Correct the In-Game Player Guide

**Files:**
- Modify: `D:\Chrome & Blood - Compiled\mods\Modlist Settings - Standard Profile\r6\storages\PlayerGuideFramework\chrome-and-blood.json`
- Modify: `D:\Chrome & Blood - Compiled\mods\Modlist Settings - Immersive Profile\r6\storages\PlayerGuideFramework\chrome-and-blood.json`

**Interfaces:**
- Consumes: Active DSB settings, active ME Armor settings, active MO2 profile lists, and the reviewed release diff from Task 1.
- Produces: Two valid profile-specific guide files whose shared entries describe the same current mechanics and whose provider arrays name enabled current providers.

- [ ] **Step 1: Parse both guides before editing**

```powershell
$standard = Get-Content -Raw 'D:\Chrome & Blood - Compiled\mods\Modlist Settings - Standard Profile\r6\storages\PlayerGuideFramework\chrome-and-blood.json' | ConvertFrom-Json
$immersive = Get-Content -Raw 'D:\Chrome & Blood - Compiled\mods\Modlist Settings - Immersive Profile\r6\storages\PlayerGuideFramework\chrome-and-blood.json' | ConvertFrom-Json
if ($standard.profile -ne 'Chrome & Blood - Standard Profile') { throw 'Wrong Standard guide.' }
if ($immersive.profile -ne 'Chrome & Blood - Immersive Profile') { throw 'Wrong Immersive guide.' }
```

Expected: both parse and expose ten sections.

- [ ] **Step 2: Replace the shared `combat-lethality` body in both guides**

Use this copy and increment the entry revision:

```text
Damage Scaling and Balance sets the list's combat curve; Very Hard still multiplies that foundation. The included profiles set every enemy tier to 45% Health, so an exposed target remains fragile. Armor, abilities, equipment, AI, and encounter role create the difference between ordinary enemies and serious threats. Expect short kill windows in both directions: open ground, a bad reload, or ignoring a dangerous specialist can end a fight quickly. Use cover, control sightlines, and remove priority targets before pushing. If combat feels wrong, change one layer at a time; Health, armor, enemy abilities, and level scaling solve different problems.
```

Keep providers `Damage Scaling and Balance` and `Damage Scaling and Balance - Extended`.

- [ ] **Step 3: Replace the shared `enemy-armor` body in both guides**

Use this copy and increment the entry revision:

```text
Armored enemies carry one to four blue segments above Health. In the included profiles, each segment holds 25% of the enemy's scaled Health and every segment uses the same 84% configured reduction. More segments add armor to break; they do not increase the reduction per hit. Armored hit zones protect even more, so scan before firing and avoid wasting ordinary rounds into the strongest plate. Weapon penetration reduces the protection, heat can hinder repair, and sustained focus stops several armored targets from resetting the fight at once. Break the armor, keep pressure on repair-capable enemies, and rescan when an ability changes the matchup. Once the blue bar is gone, the low Health underneath drops quickly.
```

Keep provider `ME Armor System`.

- [ ] **Step 4: Replace the shared `humanity-slots` body and providers**

Use this copy and increment the entry revision:

```text
Expanded cyberware slots create more combinations, but cyberware capacity and slot limits still make chrome a budget. An open slot does not mean every implant fits. Build around a coherent operating system, defenses, and utility package, then check the capacity cost before adding another implant. More icons are options, not a checklist.
```

Set providers to `CyberwareEX` and `Cyberware Improved`. Remove `Humanity`.

- [ ] **Step 5: Correct provider metadata without deleting valid mechanics**

Apply these exact metadata changes in both guides and increment each touched entry revision:

```text
job-payouts: remove Humanity - Cyberpsycho Missions; retain Much Better Eddies and the non-lethal premium copy
combat-tools: replace Much Better Impacts with Much Better Impacts (melee hitstop)
atelier-shopping: replace Virtual Atelier with Virtual Atelier 1.6.2
```

- [ ] **Step 6: Rewrite `vehicle-handling` around enabled providers**

Use this copy and increment the entry revision:

```text
Vehicles combine surface response, dynamic downforce, revised steering, and drift tuning. Cars therefore differ more sharply, and speed does not erase weight or traction. Brake before turn-in, settle the chassis, then accelerate through the exit; forcing full steering at full speed usually creates understeer or a slide. Bikes and high-performance cars need their own timing, so learn the vehicle before judging the whole handling setup.
```

Set providers to `Surface Type Expansion`, `Dynamic Downforce`, `All vehicles can steer`, and `Cyber Drift`. Remove `Limited Slip Differential` and `Cyber Grip`.

- [ ] **Step 7: Run a complete provider-reference audit**

For every `mods` value in both guide files, require an enabled exact or deliberately versioned provider in the matching MO2 profile. Resolve renamed-provider mismatches from Task 1 without changing unrelated prose.

Expected: no guide provider points only to a removed v4.1 folder.

- [ ] **Step 8: Parse and compare the edited guides**

```powershell
$paths = @(
  'D:\Chrome & Blood - Compiled\mods\Modlist Settings - Standard Profile\r6\storages\PlayerGuideFramework\chrome-and-blood.json',
  'D:\Chrome & Blood - Compiled\mods\Modlist Settings - Immersive Profile\r6\storages\PlayerGuideFramework\chrome-and-blood.json'
)
foreach ($path in $paths) {
  $guide = Get-Content -Raw $path | ConvertFrom-Json
  $ids = @($guide.sections.entries.id)
  if ($ids.Count -ne ($ids | Sort-Object -Unique).Count) { throw "Duplicate entry ID in $path" }
}
```

Expected: both parse, entry IDs remain unique, shared corrected entries match, and the known profile-only entries remain profile-only.

---

### Task 3: Replace the Website Guide with the Gateway

**Files:**
- Modify: `D:\Chrome-Blood\docs\guide.html`
- Modify only if required by preview: `D:\Chrome-Blood\docs\assets\style.css`
- Create: `D:\Chrome-Blood\docs\assets\img\guide-database.jpg`
- Create: `D:\Chrome-Blood\docs\assets\img\guide-sections.jpg`
- Create: `D:\Chrome-Blood\docs\assets\img\guide-combat.jpg`

**Interfaces:**
- Consumes: The ten Player Guide section names and ten UMS category names verified in Task 2.
- Produces: A responsive public gateway that directs players to the in-game Database and explains UMS without duplicating the in-game guide.

- [ ] **Step 1: Convert the three supplied PNGs to web JPEGs**

Use `System.Drawing` with JPEG quality 78. Preserve the existing 1920x1080 dimensions because they already meet the width cap.

```powershell
Add-Type -AssemblyName System.Drawing
$encoder = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object MimeType -eq 'image/jpeg'
$quality = [System.Drawing.Imaging.Encoder]::Quality
$parameters = [System.Drawing.Imaging.EncoderParameters]::new(1)
$parameters.Param[0] = [System.Drawing.Imaging.EncoderParameter]::new($quality, 78L)
$images = @{
  'C:\Users\qcarg\Downloads\database.png' = 'D:\Chrome-Blood\docs\assets\img\guide-database.jpg'
  'C:\Users\qcarg\Downloads\c&b showcase.png' = 'D:\Chrome-Blood\docs\assets\img\guide-sections.jpg'
  'C:\Users\qcarg\Downloads\highlight comparison.png' = 'D:\Chrome-Blood\docs\assets\img\guide-combat.jpg'
}
foreach ($source in $images.Keys) {
  $bitmap = [System.Drawing.Bitmap]::new($source)
  try { $bitmap.Save($images[$source], $encoder, $parameters) } finally { $bitmap.Dispose() }
}
```

Expected: each output exists, is 1920x1080, and is no larger than 600 KB.

- [ ] **Step 2: Rewrite `guide.html` using existing site components**

Retain the head, navigation, footer, font imports, and script links. Replace the long-form body with these sections:

```text
00 · IN-GAME GUIDE — Your Guide Is In-Game
01 · DATABASE — What the Database Covers
02 · BALANCE — How Chrome & Blood Is Balanced
03 · SETTINGS — Customize the List with UMS
04 · SUPPORT — Need Help?
```

Use existing `.pillar`, `.pillar-copy`, `.pillar-media`, `.frame`, `.feature-list`, `.callout`, `.sec-head`, and `.sec-title` classes. Do not create CSS unless the real preview exposes a layout problem.

- [ ] **Step 3: Write the Database and balance copy**

The page must state:

```text
Pause the game, open Database, and select C&B. The in-game guide carries the current controls, mechanics, counters, profile rules, and troubleshooting notes.

Chrome & Blood keeps exposed enemies fragile and uses armor, weapon roles, enemy abilities, and smarter behavior to create stronger threats. The goal is fast fights with meaningful counters, not larger Health bars.
```

List all ten current Database sections with one sentence each. Do not reproduce their entry lists.

- [ ] **Step 4: Write the UMS copy**

State that `Numpad 0` opens UMS, the included Standard and Immersive profiles carry the intended settings, and search, Favorites, Modified, and My Groups help locate changes. List the ten shared category names exactly as they appear in `browserOrganization.json`. Tell players to change one system at a time and use Modified to find what they changed.

- [ ] **Step 5: Validate links and assets statically**

```powershell
$html = Get-Content -Raw 'D:\Chrome-Blood\docs\guide.html'
foreach ($asset in @('guide-database.jpg','guide-sections.jpg','guide-combat.jpg')) {
  if ($html -notmatch [regex]::Escape($asset)) { throw "Missing $asset reference" }
  if (-not (Test-Path "D:\Chrome-Blood\docs\assets\img\$asset")) { throw "Missing $asset file" }
}
foreach ($target in @('faq.html','mods.html#rule11','https://discord.gg/U65Nhdcns8')) {
  if ($html -notmatch [regex]::Escape($target)) { throw "Missing $target" }
}
```

Expected: all references resolve.

- [ ] **Step 6: Commit the website gateway**

```powershell
git -C 'D:\Chrome-Blood' add -- 'docs/guide.html' 'docs/assets/img/guide-database.jpg' 'docs/assets/img/guide-sections.jpg' 'docs/assets/img/guide-combat.jpg'
git -C 'D:\Chrome-Blood' commit -m 'feat(site): move gameplay guidance in game'
```

Include `docs/assets/style.css` and all page cache-stamp changes only if preview required a CSS edit.

---

### Task 4: Create the Nexus Collection Description Master

**Files:**
- Create: `D:\Chrome-Blood\Modlist\NexusCollectionPage.md`
- Read: `C:\Users\qcarg\.codex\attachments\2ee49167-213d-4914-a278-996a50bad912\pasted-text.txt`

**Interfaces:**
- Consumes: Current website pillars, corrected Player Guide facts, active provider audit, and the attached collection-description Markdown.
- Produces: A Nexus-compatible collection-description master ready to paste into the collection editor.

- [ ] **Step 1: Preserve the established collection-page skeleton**

Keep the logo heading, Phantom Liberty warning, patch line, Discord link, major pillar images, two-profile section, installation requirements, links, acknowledgments, endorsement request, and sign-off from the attachment.

- [ ] **Step 2: Correct the Combat, Builds, World, and Vehicles sections**

Apply these content rules:

```text
Combat: add enemy segmented armor, weapon penetration roles, and late-game pressure; retain MBAI, Cyber Enemies, faction traits, reinforcements, TDO, and DSB.
Builds: retain Merc Protocol, Neuralware, Cyberware Improved, slot limits, and capacity; remove Humanity as a Standard-profile cost.
The World: retain Immersive Fixers, bounties, and Much Better Eddies; remove Ammo Limiter.
Vehicles: retain Nitrous, Virtual Car Dealer, Surface Type Expansion, All vehicles can steer, Dynamic Downforce, and Cyber Drift; do not name Cyber Grip or Limited Slip Differential.
```

- [ ] **Step 3: Add Database and UMS sections**

Add one section explaining `Pause Menu -> Database -> C&B` and one explaining `Numpad 0 -> UMS`. The Database section points detailed gameplay questions in game. The UMS section names search, Favorites, Modified, grouped browsing, and the curated Standard/Immersive profiles without listing every mod assignment.

- [ ] **Step 4: Reduce Keybinds to navigation**

Keep only:

```text
Numpad 0: Unified Mod Settings
User-selected CET overlay key: Cyber Engine Tweaks
Pause Menu -> Database -> C&B: Player Guide
```

Point all other controls to the in-game guide.

- [ ] **Step 5: Validate Nexus Markdown and current links**

```powershell
$path = 'D:\Chrome-Blood\Modlist\NexusCollectionPage.md'
$text = Get-Content -Raw $path
foreach ($forbidden in @('<details>','<summary>','[center]','[size=','\##','&#x20;')) {
  if ($text.Contains($forbidden)) { throw "Forbidden Nexus collection token: $forbidden" }
}
foreach ($required in @('Player Guide','Unified Mod Settings','https://qcargile.github.io/Chrome-Blood/guide.html','https://discord.gg/U65Nhdcns8')) {
  if (-not $text.Contains($required)) { throw "Missing collection content: $required" }
}
```

Expected: clean Markdown and all routing links present.

- [ ] **Step 6: Commit the collection-description master**

```powershell
git -C 'D:\Chrome-Blood' add -- 'Modlist/NexusCollectionPage.md'
git -C 'D:\Chrome-Blood' commit -m 'docs: update Nexus collection overview'
```

---

### Task 5: Draft the Website and Nexus Release Notes

**Files:**
- Modify after version approval: `D:\Chrome-Blood\changelog.md`
- Create before version approval: `D:\Chrome-Blood\Modlist\NexusChangelog-next.md`
- Rename after version approval: the `Modlist\NexusChangelog-$releaseVersion.md` path built from Quentin's confirmed version
- Read: `C:\Users\qcarg\.codex\attachments\75b728fd-8d8a-4c09-8376-c1088bc88905\pasted-text.txt`

**Interfaces:**
- Consumes: Reviewed Task 1 report and approved editorial Key Notes.
- Produces: One website `<details>` release block and one fact-identical Nexus Markdown revision changelog.

- [ ] **Step 1: Draft Key Notes from verified player-facing changes**

Use the report and current implementation evidence to draft these candidates:

```text
Combat Rebalanced from the Ground Up
Enemy and Player Armor Are Now Full Systems
Weapon Armor Penetration Regraded
The Player Guide Is Now In Game
Unified Mod Settings Reorganized
Visual and Performance Stack Refresh
```

Keep only candidates supported by the final diff. Do not invent rationale for routine mod updates.

- [ ] **Step 2: Build the nine scoped mod lists**

Use the fixed grammar:

```text
- Added **Example Mod** `v1.2`
- Updated **Example Mod** to `v1.2`
- Removed **Example Mod**
```

Keep General, Standard Profile, and Immersive Profile sections for Additions, Updates, and Removals. Keep empty sections with the established italic no-items line.

- [ ] **Step 3: Ask for the release decisions only after the factual draft exists**

Request these four values from Quentin together:

```text
release version
release date
save compatibility line
update warning, or confirmation that none is needed
```

Do not modify `changelog.md` or name the final Nexus revision file before receiving them.

- [ ] **Step 4: Create the Nexus working draft in the attached format**

Write `Modlist/NexusChangelog-next.md` with ordinary Markdown, `***` separators, all nine scoped sections, Nexus links only in Key Notes, the attached backslash hard break after each Key Note title, and no HTML detail tags.

- [ ] **Step 5: After release decisions, prepend the website block and finalize the Nexus filename**

Prepend the approved `<details>` block to `changelog.md`. Rename `NexusChangelog-next.md` to the confirmed versioned filename and replace its working header with the confirmed version, date, compatibility line, and warning.

- [ ] **Step 6: Prove website/Nexus parity**

Compare headings, Key Notes, scoped entries, versions, removal annotations, compatibility line, warning, and sign-off. The only structural difference is the website `<details>` wrapper and `---` separators versus the Nexus heading and `***` separators.

- [ ] **Step 7: Commit release-note masters**

```powershell
if ([string]::IsNullOrWhiteSpace($releaseVersion)) { throw 'Set releaseVersion from Quentin confirmation.' }
$nexusChangelog = "Modlist/NexusChangelog-$releaseVersion.md"
git -C 'D:\Chrome-Blood' add -- 'changelog.md' $nexusChangelog
git -C 'D:\Chrome-Blood' commit -m 'docs: prepare Chrome and Blood release notes'
```

Set `$releaseVersion` from Quentin's response exactly. Do not stage the unrelated v4.1 file.

---

### Task 6: Preview, Review, and Publication Handoff

**Files:**
- Verify: every task-owned file above
- Read: `D:\Chrome-Blood\docs\assets\site.js`

**Interfaces:**
- Consumes: Completed website, Player Guide, Nexus collection master, and release-note masters.
- Produces: A reviewed, locally committed, contradiction-free release surface plus Nexus editor handoff without submitting it.

- [ ] **Step 1: Start the local site preview**

```powershell
python -m http.server 4173 --directory 'D:\Chrome-Blood\docs'
```

Launch it as a hidden background process through the app tooling rather than blocking the terminal.

- [ ] **Step 2: Inspect desktop and mobile layouts**

Open `http://127.0.0.1:4173/guide.html`. Verify all five sections, three images, ten Database sections, ten UMS categories, support links, no horizontal overflow, and readable mobile stacking. Confirm the browser console is clean.

- [ ] **Step 3: Run cross-surface text checks**

Require all maintained surfaces to agree on these facts:

```text
Very Hard is the intended difficulty.
All enemy tiers use the current low-Health foundation.
Enemy armor uses one to four equal segments.
Weapon penetration is the armor counter.
Humanity is not a Standard-profile budget.
The in-game guide lives under Database -> C&B.
Numpad 0 opens UMS.
Standard and Immersive share the lethal core but differ in survival rules.
```

- [ ] **Step 4: Run CP2077 closeout review on the Player Guide changes**

Invoke `/cp2077-review` with both profile JSON files, the active DSB/ME settings evidence, and the exact v4.1-to-current provider diff. Fix every evidence-backed finding and rerun parsing and provider checks.

- [ ] **Step 5: Review public copy for stale providers and duplicate guidance**

Search website and Nexus masters for:

```text
Humanity
Ammo Limiter
Limited Slip Differential
Cyber Grip
full website hotkey table
tier-specific enemy Health
higher segments reduce more damage
```

Each match must be either removed or explicitly limited to the Immersive profile where current behavior supports it.

- [ ] **Step 6: Verify Git scope and commit state**

```powershell
git -C 'D:\Chrome-Blood' status --short --branch
git -C 'D:\Chrome-Blood' diff --check origin/main...HEAD
git -C 'D:\Chrome-Blood' log --oneline origin/main..HEAD
```

Expected: only the pre-existing untracked `Modlist/NexusChangelog-v4.1.md` remains outside committed task scope.

- [ ] **Step 7: Push the repository only after all release surfaces are complete**

```powershell
git -C 'D:\Chrome-Blood' push origin main
gh api repos/qcargile/Chrome-Blood/pages/builds/latest --jq '.status'
```

Wait until Pages reports `built`, then load the live Guide and changelog URLs and verify the new content.

- [ ] **Step 8: Prepare Nexus editors without publishing**

Paste `Modlist/NexusCollectionPage.md` into the collection-description Markdown editor and the confirmed versioned Nexus changelog into the matching revision editor. Leave both pages open with their **Update** controls enabled. Do not select either control.

- [ ] **Step 9: Lock the release baseline after Quentin publishes**

After Quentin confirms both Nexus updates and the release are public:

```powershell
if ([string]::IsNullOrWhiteSpace($releaseVersion)) { throw 'Set releaseVersion from Quentin confirmation.' }
gh api -H 'Accept: application/vnd.github.raw' repos/qcargile/Chrome-Blood/contents/changelog.md > 'D:\Chrome & Blood - Changelogs\releases\changelog-published.md'
& 'D:\Chrome & Blood - Changelogs\tools\snapshot.ps1' -Label "release-$releaseVersion"
& 'D:\Chrome & Blood - Changelogs\tools\loadorder-export.ps1' -Release $releaseVersion
```

Set `$releaseVersion` from Quentin's response exactly. Verify the public Nexus revision renders real headings and lists and does not display literal Markdown markers.
