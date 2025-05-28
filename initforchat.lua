local settings = {
  npcDamageScaling = {1, 1, 1, 1, 1, 1, 1},
  playerDamageScaling = {1, 1, 1, 1, 1, 1, 1},
  -- npcHealScaling = 0,
  npcPreset = 'Default',
  playerPreset = 'Default',
  customNpcPreset = {1, 1, 1, 1, 1, 1, 1},
  customPlayerPreset = {1, 1, 1, 1, 1, 1, 1},
  npcApplyToNonPlayerSource = false,
  playerApplyToExplosions = false,

  trashDamageMultplier = 1,
  weakDamageMultiplier = 1,
  normalDamageMultiplier = 1,
  officerDamageMultiplier = 1,
  rareDamageMultiplier = 1,
  eliteDamageMultiplier = 1,
  bossDamageMultiplier = 1,
  maxtacDamageMultiplier = 1,

  staminaCostMultiplier = 1,
  headhshotMultiplier = 1,
  quickhackDamageMult = 1,
  grenadeDamageMult = 1,
  mechanicalEnemyDamageMult = 1,
  npcMeleeDamageMult = 1,
  playerMeleeDamageMult = 1
}

local minMult = 0.0
local maxMult = 10.0

local levels = {1, 10, 20, 30, 40, 50, 60}
local npcLevelOptions = {}
local npcPresetTable = {}
local playerLevelOptions = {}
local playerPresetTable = {}
local presetInProgress = false

local GameUI = require('GameUI')
local GameSettings = require('GameSettings')
local lang = ""

local npcPresetDisplayNames
local playerPresetDisplayNames

local npcPresetNames = {
  'Custom',
  'Default',
  'RMK_Balanced',
  'RMK_Balanced_Classic',
  'Mult_0.5',
  'Mult_2.0',
  'Mult_0.0',
  'Mult_Max'
}

local playerPresetNames = {
  'Custom',
  'Default',
  'Mult_0.5',
  'Mult_2.0',
  'Mult_0.0',
  'Mult_Max'
}

function SetNpcPresetDisplayNames()
  npcPresetDisplayNames = {
    GetLocalizedText("LocKey#51770"), -- Custom
    GetLocalizedText("LocKey#23369"), -- Default
    'RMK ' .. GetLocalizedText("LocKey#78377"), -- RMK Balanced
    'RMK ' .. GetLocalizedText("LocKey#78377") .. ' ' .. GetLocalizedText("LocKey#91181"), -- RMK Balanced Classic 
    "0.5x " .. GetLocalizedText("LocKey#36314"), -- 0.5x Damage
    "2x " .. GetLocalizedText("LocKey#36314"), -- 2x Damage
    GetLocalizedText("LocKey#6544"), -- Invincible
    GetLocalizedText("LocKey#1303") -- Vulnerable
  }
end

function SetPlayerPresetDisplayNames()
  playerPresetDisplayNames = {
    GetLocalizedText("LocKey#51770"), -- Custom
    GetLocalizedText("LocKey#23369"), -- Default
    "0.5x " .. GetLocalizedText("LocKey#36314"), -- 0.5x Damage
    "2x " .. GetLocalizedText("LocKey#36314"), -- 2x Damage
    GetLocalizedText("LocKey#6544"), -- Invincible
    GetLocalizedText("LocKey#1303") -- Vulnerable
  }
end

function HandlePreset(presetName, isForPlayer)
  local settingsProperty = 'npcDamageScaling'
  local customPreset = settings.customNpcPreset
  if isForPlayer then
    settingsProperty = 'playerDamageScaling'
    customPreset = settings.customPlayerPreset
  end
  if presetName == 'Custom' then
    settings[settingsProperty] = customPreset
  elseif presetName == 'Default' then
    settings[settingsProperty] = {1, 1, 1, 1, 1, 1, 1}
  elseif presetName == 'RMK_Balanced' then
    settings[settingsProperty] = {1, 1, 0.85, 0.72, 0.6, 0.5, 0.4}
  elseif presetName == 'RMK_Balanced_Classic' then
    settings[settingsProperty] = {1, 0.7, 0.55, 0.45, 0.38, 0.33, 0.25}
  elseif presetName == 'Mult_0.5' then
    settings[settingsProperty] = {0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5}
  elseif presetName == 'Mult_2.0' then
    settings[settingsProperty] = {2, 2, 2, 2, 2, 2, 2}
  elseif presetName == 'Mult_0.0' then
    settings[settingsProperty] = {0, 0, 0, 0, 0, 0, 0}
  elseif presetName == 'Mult_Max' then
    settings[settingsProperty] = {maxMult, maxMult, maxMult, maxMult, maxMult, maxMult, maxMult}
  end
end

local oldNpcPresetValuesToNewNames = {
  'Custom',
  'Default',
  'RMK_Balanced_Classic',
  'Mult_0.5',
  'Mult_2.0',
  'Mult_0.0',
  'Mult_Max'
}

local oldPlayerPresetValuesToNewNames = {
  'Custom',
  'Default',
  'Mult_0.5',
  'Mult_2.0',
  'Mult_0.0',
  'Mult_Max'
}

function UpdateSettingsForLevel60()
  if #settings.npcDamageScaling == 6 then
    -- one time format update
    settings.npcPreset = oldNpcPresetValuesToNewNames[settings.npcPreset]
    settings.playerPreset = oldPlayerPresetValuesToNewNames[settings.playerPreset]
    -- one time addition of level 60
    if settings.npcPreset == 'RMK_Balanced_Classic' then
      settings.npcDamageScaling[7] = 0.25
    else
      settings.npcDamageScaling[7] = settings.npcDamageScaling[6]
    end
    settings.playerDamageScaling[7] = settings.playerDamageScaling[6]
    settings.customNpcPreset[7] = settings.customNpcPreset[6]
    settings.customPlayerPreset[7] = settings.customPlayerPreset[6]

    -- round boss damage multiplier to new restriction
    settings.bossDamageMultiplier = Round(settings.bossDamageMultiplier, 1)

    SaveSettings()
  end
end

registerForEvent("onInit", function()
  lang = NameToString(GameSettings.Get("/language/OnScreen"))

  SetNpcPresetDisplayNames()
  SetPlayerPresetDisplayNames()

  SetupLanguageListener()
  LoadSettings()
  UpdateSettingsForLevel60()
  SetupMenu()

  Override('DamageScalingAndBalance.DamageScalingAndBalance', 'StaminaCostMultiplier;', function()
    return settings.staminaCostMultiplier
  end)

  Override('DamageScalingAndBalance.DamageScalingAndBalance', 'HeadshotMultiplier;', function()
    return settings.headhshotMultiplier
  end)

  Override('DamageScalingAndBalance.DamageScalingAndBalance', 'QuickhackDamageMultiplier;', function()
    return settings.quickhackDamageMult
  end)

  Override('DamageScalingAndBalance.DamageScalingAndBalance', 'GrenadeDamageMultiplier;', function()
    return settings.grenadeDamageMult
  end)

  Override('DamageScalingAndBalance.DamageScalingAndBalance', 'MechanicalDamageMultiplier;', function()
    return settings.mechanicalEnemyDamageMult
  end)

  Override('DamageScalingAndBalance.DamageScalingAndBalance', 'NpcMeleeDamageMultiplier;', function()
    return settings.npcMeleeDamageMult
  end)

  Override('DamageScalingAndBalance.DamageScalingAndBalance', 'PlayerMeleeDamageMultiplier;', function()
    return settings.playerMeleeDamageMult
  end)

  ObserveBefore("DamageSystem", "ProcessOneShotProtection", function(this, hitEvent)
    local target = hitEvent.target
    local instigator = hitEvent.attackData.instigator
    if target then
      if not target:IsA('ScriptedPuppet') and not target:IsA('SecurityTurret') then
        return
      end
      local level = GameInstance.GetStatsSystem():GetStatValue(target:GetEntityID(), gamedataStatType.PowerLevel)
      if not target:IsPlayer() then
        -- NPC target
        -- don't affect suicides
        if hitEvent.attackData.attackDefinition ~= nil and hitEvent.attackData.attackDefinition:GetRecord():GetID() == TweakDBID.new('Attacks.ForceSuicideGunAttack') then
          return
        end

        if target:IsA('ScriptedPuppet') then
          if hitEvent.target:GetNPCRarity() == gamedataNPCRarity.Trash then
            ScaleDamage(hitEvent, settings.trashDamageMultplier)
          elseif hitEvent.target:GetNPCRarity() == gamedataNPCRarity.Weak then
            ScaleDamage(hitEvent, settings.weakDamageMultiplier)
          elseif hitEvent.target:GetNPCRarity() == gamedataNPCRarity.Normal then
            ScaleDamage(hitEvent, settings.normalDamageMultiplier)
          elseif hitEvent.target:GetNPCRarity() == gamedataNPCRarity.Officer then
            ScaleDamage(hitEvent, settings.officerDamageMultiplier)
          elseif hitEvent.target:GetNPCRarity() == gamedataNPCRarity.Rare then
            ScaleDamage(hitEvent, settings.rareDamageMultiplier)
          elseif hitEvent.target:GetNPCRarity() == gamedataNPCRarity.Elite then
            ScaleDamage(hitEvent, settings.eliteDamageMultiplier)
          elseif hitEvent.target:GetNPCRarity() == gamedataNPCRarity.Boss then
            ScaleDamage(hitEvent, settings.bossDamageMultiplier)
          elseif hitEvent.target:GetNPCRarity() == gamedataNPCRarity.MaxTac then
            ScaleDamage(hitEvent, settings.maxtacDamageMultiplier)
          end
        end

        if not instigator or (instigator and not instigator:IsPlayer()) then
          -- explosion, attack from NPC, or other unattributed attack
          if settings.npcApplyToNonPlayerSource then
            ScaleDamage(hitEvent, GetValueFromCurve(levels, settings.npcDamageScaling, level))
          end
          return
        end
        ScaleDamage(hitEvent, GetValueFromCurve(levels, settings.npcDamageScaling, level))
      else
        -- Player target
        if not instigator or (instigator and instigator:IsPlayer()) then
          -- self-damage (grenade), explosion or other unattributed attack
          if settings.playerApplyToExplosions then
            ScaleDamage(hitEvent, GetValueFromCurve(levels, settings.playerDamageScaling, level))
          end
          return
        end

        ScaleDamage(hitEvent, GetValueFromCurve(levels, settings.playerDamageScaling, level))
      end
    end
  end)

  -- Override("PlayerStaminaHelpers", "ModifyStamina;PlayerPuppetFloatBool", function(_, player, delta, perc, wrapped)
  --   print('changing stamina from ' .. delta .. ' to ' .. (delta * settings.staminaCostMultiplier))
  --   delta = delta * settings.staminaCostMultiplier
  --   wrapped(player, delta, perc)
  -- end)

  -- this is no longer called where I'm looking for it in ModifyStatPoolModifierEffector, instead it's a slightly different one that doesn't allow this easy change here.
  -- Override("StatPoolsSystem", "RequestSettingModifier", function(this, objID, statPoolType, type, modifier, wrapped)
  --   if StatsObjectID.IsDefined(objID) and StatsObjectID.IsEntity(objID) and statPoolType == gamedataStatPoolType.Health and modifier.valuePerSec > 0 and type == gameStatPoolModificationTypes.Regeneration then
  --     local level = GameInstance.GetStatsSystem():GetStatValue(StatsObjectID.ExtractEntityID(objID), gamedataStatType.PowerLevel)
  --     local damageScaling = GetValueFromCurve(levels, settings.npcDamageScaling, level)
  --     local healScaling = 1
  --     if damageScaling > 1 then
  --       healScaling = (damageScaling - 1) * settings.npcHealScaling / 100 + 1
  --     elseif damageScaling < 1 then
  --       healScaling = 1 - (1 - damageScaling) * settings.npcHealScaling / 100
  --     end
  --     modifier.valuePerSec = modifier.valuePerSec * healScaling
  --   end

  --   wrapped(objID, statPoolType, type, modifier)
  -- end)
end)

function SetupLanguageListener()
  GameUI.Listen("MenuNav", function(state)
		if state.lastSubmenu ~= nil and state.lastSubmenu == "Settings" then
      SaveSettings()

      local newLang = NameToString(GameSettings.Get("/language/OnScreen"))
      if lang ~= newLang then
        lang = newLang
        SetupMenu()
      end
    end
	end)
end

function LoadSettings()
  local file = io.open('settings.json', 'r')
  if file ~= nil then
    local contents = file:read("*a")
    local validJson, savedSettings = pcall(function() return json.decode(contents) end)
    file:close()

    if validJson then
      for key, _ in pairs(settings) do
        if savedSettings[key] ~= nil then
          settings[key] = savedSettings[key]
        end
      end
    end
  end
end

function SaveSettings()
  local validJson, contents = pcall(function() return json.encode(settings) end)

  if validJson and contents ~= nil then
    local file = io.open("settings.json", "w+")
    file:write(PrettifyJSON(contents))
    file:close()
  end
end

function IndexOf(array, value)
  for i, v in ipairs(array) do
      if v == value then
          return i
      end
  end
  return nil
end

function SetupMenu()
  local nativeSettings = GetMod("nativeSettings")

  if not nativeSettings.pathExists("/DamageScaling") then
    nativeSettings.addTab("/DamageScaling", "Dmg. Scaling")
  end

  if nativeSettings.pathExists("/DamageScaling/npc_damage_scaling") then
    nativeSettings.removeSubcategory("/DamageScaling/npc_damage_scaling")
  end
  nativeSettings.addSubcategory("/DamageScaling/npc_damage_scaling", GetText('damage_to_npc_mult'))
  
  -- Parameters: path, label, desc, elements, currentValue, defaultValue, callback
  npcPresetTable = nativeSettings.addSelectorString("/DamageScaling/npc_damage_scaling", GetLocalizedText("LocKey#51058"), "", npcPresetDisplayNames, IndexOf(npcPresetNames, settings.npcPreset), IndexOf(npcPresetNames, 'Default'), function(value)
    local presetName = npcPresetNames[value]
    settings.npcPreset = presetName

    HandlePreset(presetName, false)

    presetInProgress = true
    for i, val  in ipairs(settings.npcDamageScaling) do
      nativeSettings.setOption(npcLevelOptions[i], val)
    end
    presetInProgress = false
  end)

  npcLevelOptions = {}
  local opt

  -- Parameters: path, label, desc, min, max, step, format, currentValue, defaultValue, callback
  opt = nativeSettings.addRangeFloat("/DamageScaling/npc_damage_scaling", GetDescription(1), GetText('damage_mult_desc'), minMult, maxMult, 0.01, "%.2f", settings.npcDamageScaling[1], 1, function(value)
    settings.npcDamageScaling[1] = value
    if not presetInProgress then
      settings.customNpcPreset = settings.npcDamageScaling
      nativeSettings.setOption(npcPresetTable, 1)
    end
  end)
  table.insert(npcLevelOptions, opt)

  opt = nativeSettings.addRangeFloat("/DamageScaling/npc_damage_scaling", GetDescription(10), GetText('damage_mult_desc'), minMult, maxMult, 0.01, "%.2f", settings.npcDamageScaling[2], 1, function(value)
    settings.npcDamageScaling[2] = value
    if not presetInProgress then
      settings.customNpcPreset = settings.npcDamageScaling
      nativeSettings.setOption(npcPresetTable, 1)
    end
  end)
  table.insert(npcLevelOptions, opt)
  
  opt = nativeSettings.addRangeFloat("/DamageScaling/npc_damage_scaling", GetDescription(20), GetText('damage_mult_desc'), minMult, maxMult, 0.01, "%.2f", settings.npcDamageScaling[3], 1, function(value)
    settings.npcDamageScaling[3] = value
    if not presetInProgress then
      settings.customNpcPreset = settings.npcDamageScaling
      nativeSettings.setOption(npcPresetTable, 1)
    end
  end)
  table.insert(npcLevelOptions, opt)

  opt = nativeSettings.addRangeFloat("/DamageScaling/npc_damage_scaling", GetDescription(30), GetText('damage_mult_desc'), minMult, maxMult, 0.01, "%.2f", settings.npcDamageScaling[4], 1, function(value)
    settings.npcDamageScaling[4] = value
    if not presetInProgress then
      settings.customNpcPreset = settings.npcDamageScaling
      nativeSettings.setOption(npcPresetTable, 1)
    end
  end)
  table.insert(npcLevelOptions, opt)

  opt = nativeSettings.addRangeFloat("/DamageScaling/npc_damage_scaling", GetDescription(40), GetText('damage_mult_desc'), minMult, maxMult, 0.01, "%.2f", settings.npcDamageScaling[5], 1, function(value)
    settings.npcDamageScaling[5] = value
    if not presetInProgress then
      settings.customNpcPreset = settings.npcDamageScaling
      nativeSettings.setOption(npcPresetTable, 1)
    end
  end)
  table.insert(npcLevelOptions, opt)

  opt = nativeSettings.addRangeFloat("/DamageScaling/npc_damage_scaling", GetDescription(50), GetText('damage_mult_desc'), minMult, maxMult, 0.01, "%.2f", settings.npcDamageScaling[6], 1, function(value)
    settings.npcDamageScaling[6] = value
    if not presetInProgress then
      settings.customNpcPreset = settings.npcDamageScaling
      nativeSettings.setOption(npcPresetTable, 1)
    end
  end)
  table.insert(npcLevelOptions, opt)

  opt = nativeSettings.addRangeFloat("/DamageScaling/npc_damage_scaling", GetDescription(60), GetText('damage_mult_desc'), minMult, maxMult, 0.01, "%.2f", settings.npcDamageScaling[7], 1, function(value)
    settings.npcDamageScaling[7] = value
    if not presetInProgress then
      settings.customNpcPreset = settings.npcDamageScaling
      nativeSettings.setOption(npcPresetTable, 1)
    end
  end)
  table.insert(npcLevelOptions, opt)

  nativeSettings.addSwitch("/DamageScaling/npc_damage_scaling", GetText('npc_to_npc'), "", settings.npcApplyToNonPlayerSource, false, function(state)
    settings.npcApplyToNonPlayerSource = state
  end)

  if nativeSettings.pathExists("/DamageScaling/npc_tiers") then
    nativeSettings.removeSubcategory("/DamageScaling/npc_tiers")
  end
  nativeSettings.addSubcategory("/DamageScaling/npc_tiers", GetText('npc_rarity_mults'))

  nativeSettings.addRangeFloat("/DamageScaling/npc_tiers", GetText('trash'), "", minMult, maxMult, 0.05, "%.2f", settings.trashDamageMultplier, 1, function(value)
    settings.trashDamageMultplier = value
  end)
  nativeSettings.addRangeFloat("/DamageScaling/npc_tiers", GetText('weak'), "", minMult, maxMult, 0.05, "%.2f", settings.weakDamageMultiplier, 1, function(value)
    settings.weakDamageMultiplier = value
  end)
  nativeSettings.addRangeFloat("/DamageScaling/npc_tiers", GetLocalizedText("LocKey#52791"), "", minMult, maxMult, 0.05, "%.2f", settings.normalDamageMultiplier, 1, function(value)
    settings.normalDamageMultiplier = value
  end)
  nativeSettings.addRangeFloat("/DamageScaling/npc_tiers", GetText('officer'), "", minMult, maxMult, 0.05, "%.2f", settings.officerDamageMultiplier, 1, function(value)
    settings.officerDamageMultiplier = value
  end)
  nativeSettings.addRangeFloat("/DamageScaling/npc_tiers", GetText('rare'), "", minMult, maxMult, 0.05, "%.2f", settings.rareDamageMultiplier, 1, function(value)
    settings.rareDamageMultiplier = value
  end)
  nativeSettings.addRangeFloat("/DamageScaling/npc_tiers", GetText('elite') .. ' (' .. GetLocalizedText("LocKey#35253") .. ')', "", minMult, maxMult, 0.05, "%.2f", settings.eliteDamageMultiplier, 1, function(value)
    settings.eliteDamageMultiplier = value
  end)
  nativeSettings.addRangeFloat("/DamageScaling/npc_tiers", GetText('boss'), "", minMult, maxMult, 0.05, "%.2f", settings.bossDamageMultiplier, 1, function(value)
    settings.bossDamageMultiplier = value
  end)
  nativeSettings.addRangeFloat("/DamageScaling/npc_tiers", GetLocalizedText("LocKey#20959"), "", minMult, maxMult, 0.05, "%.2f", settings.maxtacDamageMultiplier, 1, function(value)
    settings.maxtacDamageMultiplier = value
  end)

  if nativeSettings.pathExists("/DamageScaling/npc_other_mults") then
    nativeSettings.removeSubcategory("/DamageScaling/npc_other_mults")
  end
  nativeSettings.addSubcategory("/DamageScaling/npc_other_mults", GetText('npc_other_mults'))

  -- nativeSettings.addRangeFloat("/DamageScaling/npc_damage_scaling", GetHealDescription(), GetHealDescriptionText(), 0, 100, 1, "%.0f", settings.npcHealScaling, 0, function(value)
  --   settings.npcHealScaling = value
  -- end)
  
  nativeSettings.addRangeFloat("/DamageScaling/npc_other_mults", GetLocalizedText("LocKey#77692"), "", minMult, maxMult, 0.05, "%.2f", settings.headhshotMultiplier, 1, function(value)
    settings.headhshotMultiplier = value
  end)

  nativeSettings.addRangeFloat("/DamageScaling/npc_other_mults", GetLocalizedText("LocKey#91478") .. ' - ' .. GetText('multiplier'), "", minMult, maxMult, 0.05, "%.2f", settings.quickhackDamageMult, 1, function(value)
    settings.quickhackDamageMult = value
  end)

  nativeSettings.addRangeFloat("/DamageScaling/npc_other_mults", GetLocalizedText("LocKey#29192") .. ' - ' .. GetLocalizedText("LocKey#22445") .. ' - ' .. 'Mech' .. ' - ' .. GetText('multiplier'), "", minMult, maxMult, 0.05, "%.2f", settings.mechanicalEnemyDamageMult, 1, function(value)
    settings.mechanicalEnemyDamageMult = value
  end)

  nativeSettings.addRangeFloat("/DamageScaling/npc_other_mults", GetLocalizedText("LocKey#91463") .. ' - ' .. GetText('multiplier'), "", minMult, maxMult, 0.05, "%.2f", settings.grenadeDamageMult, 1, function(value)
    settings.grenadeDamageMult = value
  end)

  nativeSettings.addRangeFloat("/DamageScaling/npc_other_mults", GetLocalizedText("LocKey#91461") .. ' - ' .. GetText('multiplier'), "", minMult, maxMult, 0.05, "%.2f", settings.npcMeleeDamageMult, 1, function(value)
    settings.npcMeleeDamageMult = value
  end)

  if nativeSettings.pathExists("/DamageScaling/player_damage_scaling") then
    nativeSettings.removeSubcategory("/DamageScaling/player_damage_scaling")
  end
  nativeSettings.addSubcategory("/DamageScaling/player_damage_scaling", GetText('damage_to_player_mult'))
  
  -- Parameters: path, label, desc, elements, currentValue, defaultValue, callback
  playerPresetTable = nativeSettings.addSelectorString("/DamageScaling/player_damage_scaling", GetLocalizedText("LocKey#51058"), "", playerPresetDisplayNames, IndexOf(playerPresetNames, settings.playerPreset), IndexOf(playerPresetNames, 'Default'), function(value)
    local presetName = playerPresetNames[value]
    settings.playerPreset = presetName

    HandlePreset(presetName, true)

    presetInProgress = true
    for i, val  in ipairs(settings.playerDamageScaling) do
      nativeSettings.setOption(playerLevelOptions[i], val)
    end
    presetInProgress = false
  end)

  playerLevelOptions = {}

  -- Parameters: path, label, desc, min, max, step, format, currentValue, defaultValue, callback
  opt = nativeSettings.addRangeFloat("/DamageScaling/player_damage_scaling", GetDescription(1), GetText('damage_mult_desc'), minMult, maxMult, 0.01, "%.2f", settings.playerDamageScaling[1], 1, function(value)
    settings.playerDamageScaling[1] = value
    if not presetInProgress then
      settings.customPlayerPreset = settings.playerDamageScaling
      nativeSettings.setOption(playerPresetTable, 1)
    end
  end)
  table.insert(playerLevelOptions, opt)

  opt = nativeSettings.addRangeFloat("/DamageScaling/player_damage_scaling", GetDescription(10), GetText('damage_mult_desc'), minMult, maxMult, 0.01, "%.2f", settings.playerDamageScaling[2], 1, function(value)
    settings.playerDamageScaling[2] = value
    if not presetInProgress then
      settings.customPlayerPreset = settings.playerDamageScaling
      nativeSettings.setOption(playerPresetTable, 1)
    end
  end)
  table.insert(playerLevelOptions, opt)
  
  opt = nativeSettings.addRangeFloat("/DamageScaling/player_damage_scaling", GetDescription(20), GetText('damage_mult_desc'), minMult, maxMult, 0.01, "%.2f", settings.playerDamageScaling[3], 1, function(value)
    settings.playerDamageScaling[3] = value
    if not presetInProgress then
      settings.customPlayerPreset = settings.playerDamageScaling
      nativeSettings.setOption(playerPresetTable, 1)
    end
  end)
  table.insert(playerLevelOptions, opt)

  opt = nativeSettings.addRangeFloat("/DamageScaling/player_damage_scaling", GetDescription(30), GetText('damage_mult_desc'), minMult, maxMult, 0.01, "%.2f", settings.playerDamageScaling[4], 1, function(value)
    settings.playerDamageScaling[4] = value
    if not presetInProgress then
      settings.customPlayerPreset = settings.playerDamageScaling
      nativeSettings.setOption(playerPresetTable, 1)
    end
  end)
  table.insert(playerLevelOptions, opt)

  opt = nativeSettings.addRangeFloat("/DamageScaling/player_damage_scaling", GetDescription(40), GetText('damage_mult_desc'), minMult, maxMult, 0.01, "%.2f", settings.playerDamageScaling[5], 1, function(value)
    settings.playerDamageScaling[5] = value
    if not presetInProgress then
      settings.customPlayerPreset = settings.playerDamageScaling
      nativeSettings.setOption(playerPresetTable, 1)
    end
  end)
  table.insert(playerLevelOptions, opt)

  opt = nativeSettings.addRangeFloat("/DamageScaling/player_damage_scaling", GetDescription(50), GetText('damage_mult_desc'), minMult, maxMult, 0.01, "%.2f", settings.playerDamageScaling[6], 1, function(value)
    settings.playerDamageScaling[6] = value
    if not presetInProgress then
      settings.customPlayerPreset = settings.playerDamageScaling
      nativeSettings.setOption(playerPresetTable, 1)
    end
  end)
  table.insert(playerLevelOptions, opt)

  opt = nativeSettings.addRangeFloat("/DamageScaling/player_damage_scaling", GetDescription(60), GetText('damage_mult_desc'), minMult, maxMult, 0.01, "%.2f", settings.playerDamageScaling[7], 1, function(value)
    settings.playerDamageScaling[7] = value
    if not presetInProgress then
      settings.customPlayerPreset = settings.playerDamageScaling
      nativeSettings.setOption(playerPresetTable, 1)
    end
  end)
  table.insert(playerLevelOptions, opt)

  nativeSettings.addSwitch("/DamageScaling/player_damage_scaling", GetText('player_explosion_self'), "", settings.playerApplyToExplosions, false, function(state)
    settings.playerApplyToExplosions = state
  end)

  nativeSettings.addRangeFloat("/DamageScaling/player_damage_scaling", GetLocalizedText("LocKey#91461") .. ' - ' .. GetText('multiplier'), "", minMult, maxMult, 0.05, "%.2f", settings.playerMeleeDamageMult, 1, function(value)
    settings.playerMeleeDamageMult = value
  end)

  nativeSettings.refresh()

  if nativeSettings.pathExists("/DamageScaling/player_stamina") then
    nativeSettings.removeSubcategory("/DamageScaling/player_stamina")
  end
  nativeSettings.addSubcategory("/DamageScaling/player_stamina", GetLocalizedText("LocKey#87963"))

  -- 77692 headshot damage multiplier

  -- 87963 stamina cost
  -- 
  nativeSettings.addRangeFloat("/DamageScaling/player_stamina", GetLocalizedText("LocKey#87963") .. ' - ' .. GetText('multiplier'), "", 0, maxMult, 0.05, "%.2f", settings.staminaCostMultiplier, 1, function(value)
    settings.staminaCostMultiplier = value
  end)
end

function ScaleDamage(hitEvent, multiplier)
  local attackValues = hitEvent.attackComputed:GetAttackValues()
  for i, val in ipairs(attackValues) do
    attackValues[i] = val * multiplier
  end
  hitEvent.attackComputed:SetAttackValues(attackValues)
end

function GetDescription(level)
  -- Level = 22291
  return GetLocalizedText("LocKey#22291") .. " - " .. level
end

function GetValueFromCurve(xVals, yVals, input)
  local lastY = yVals[1]
  for i, val in ipairs(xVals) do
    lastY = yVals[i]
    if input < val then
      if i == 1 then
        return yVals[1]
      end
      return LinearInterpolate(input, xVals[i - 1], yVals[ i - 1], val, yVals[i])
    end
  end
  return lastY
end

function LinearInterpolate(x, x0, y0, x1, y1)
  if x1 == x0 then
    return y0
  end
  return (y0 * (x1 - x) + y1 * (x - x0)) / (x1 - x0)
end

function Round(number, decimals)
  local power = 10^decimals
  return math.floor(number * power) / power
end

function GetLocalization(langCode)
  local localization = loadfile('localization/' .. langCode .. '.lua')
  if localization ~= nil then
    return localization()
  end
  return {}
end

function PrettifyJSON(json)
  local indent = '  '
  local prettyJSON = ''
  local count = 0
  for c in json:gmatch"." do
    if c == '[' or c == '{' then
      prettyJSON = prettyJSON .. c .. '\n'
      count = count + 1
      for i=1,count do
        prettyJSON = prettyJSON .. indent
      end
    elseif c == ',' then
      prettyJSON = prettyJSON .. ',\n'
      for i=1,count do
        prettyJSON = prettyJSON .. indent
      end
    elseif c == ']' or c == '}' then
      count = count - 1
      prettyJSON = prettyJSON .. '\n'
      for i=1,count do
        prettyJSON = prettyJSON .. indent
      end
      prettyJSON = prettyJSON .. c
    elseif c == ':' then
      prettyJSON = prettyJSON .. c .. ' '
    else
      prettyJSON = prettyJSON .. c
    end
  end
  return prettyJSON
end

local translations = {
  pl = GetLocalization('pl'),
  en = GetLocalization('en'),
  es = GetLocalization('es'),
  fr = GetLocalization('fr'),
  it = GetLocalization('it'),
  de = GetLocalization('de'),
  kr = GetLocalization('kr'),
  zh_cn = GetLocalization('zh-cn'),
  ru = GetLocalization('ru'),
  pt = GetLocalization('pt'),
  jp = GetLocalization('jp'),
  zh_tw = GetLocalization('zh-tw'),
  ar = GetLocalization('ar'),
  cz = GetLocalization('cz'),
  hu = GetLocalization('hu'),
  tr = GetLocalization('tr'),
  th = GetLocalization('th'),
  ua = GetLocalization('ua')
}

function GetText(key)
  local translation = {}
  if     lang == 'pl-pl' then translation = translations['pl']
  elseif lang == 'en-us' then translation = translations['en']
  elseif lang == 'es-es' or lang == 'es-mx' then translation = translations['es']
  elseif lang == 'fr-fr' then translation = translations['fr']
  elseif lang == 'it-it' then translation = translations['it']
  elseif lang == 'de-de' then translation = translations['de']
  elseif lang == 'kr-kr' then translation = translations['kr']
  elseif lang == 'zh-cn' then translation = translations['zh_cn']
  elseif lang == 'ru-ru' then translation = translations['ru']
  elseif lang == 'pt-br' then translation = translations['pt']
  elseif lang == 'jp-jp' then translation = translations['jp']
  elseif lang == 'zh-tw' then translation = translations['zh_tw']
  elseif lang == 'ar-ar' then translation = translations['ar']
  elseif lang == 'cz-cz' then translation = translations['cz']
  elseif lang == 'hu-hu' then translation = translations['hu']
  elseif lang == 'tr-tr' then translation = translations['tr']
  elseif lang == 'th-th' then translation = translations['th']
  elseif lang == 'ua-ua' then translation = translations['ua']
  end

  if translation[key] ~= nil then
    return translation[key]
  else
    return translations['en'][key]
  end
end

-- function GetHealDescription()
--   if     lang == 'pl-pl' then return "Skalowanie leczenia NPC"
--   elseif lang == 'en-us' then return 'NPC Healing scaling'
--   elseif lang == 'es-es' or lang == 'es-mx' then return "Escalado de curación de NPC"
--   elseif lang == 'fr-fr' then return 'Ridimensionamento della guarigione degli NPC'
--   elseif lang == 'it-it' then return "Ridimensionamento della guarigione degli NPC"
--   elseif lang == 'de-de' then return "Skalierung der NPC-Heilung"
--   elseif lang == 'kr-kr' then return "NPC 힐링 스케일링" -- Korean
--   elseif lang == 'zh-cn' then return "NPC治疗缩放" -- Simplified Chinese
--   elseif lang == 'ru-ru' then return "Масштабирование исцеления NPC" -- Russian
--   elseif lang == 'pt-br' then return "Escala de cura de NPC" -- Brazilian Portuguese
--   elseif lang == 'jp-jp' then return "NPCヒーリングスケーリング" -- Japanese
--   elseif lang == 'zh-tw' then return "NPC治療縮放" -- Traditional Chinese
--   elseif lang == 'ar-ar' then return "تحجيم الشفاء من NPC" -- Arabic
--   elseif lang == 'cz-cz' then return "NPC Healing škálování" -- Czech
--   elseif lang == 'hu-hu' then return "NPC Healing skálázás" -- Hungarian
--   elseif lang == 'tr-tr' then return "NPC İyileştirme ölçeklendirme" -- Turkish
--   elseif lang == 'th-th' then return "สเกลการรักษาของ NPC" -- Thai
--   else return ""
--   end
-- end

-- function GetHealDescriptionText()
--   if     lang == 'pl-pl' then return "Procent mnożnika obrażeń NPC zastosowany do leczenia NPC (wymaga przeładowania)"
--   elseif lang == 'en-us' then return "Percentage of NPC damage multiplier applied to NPC healing (requires reload)"
--   elseif lang == 'es-es' or lang == 'es-mx' then return "Porcentaje del multiplicador de daño de NPC aplicado a la curación de NPC (requiere recargar)"
--   elseif lang == 'fr-fr' then return "Pourcentage du multiplicateur de dommages de la NPC appliquée à la cicatrisation des NPC (nécessite recharger)"
--   elseif lang == 'it-it' then return "Percentuale del moltiplicatore del danno NPC applicato alla guarigione NPC (richiede ricarica)"
--   elseif lang == 'de-de' then return "Prozentsatz des NPC-Schadensmultiplikators, der auf die NPC-Heilung angewendet wird (erfordert Neuladen)"
--   elseif lang == 'kr-kr' then return "NPC 치유에 적용된 NPC 피해 배율의 비율(재장전 필요)" -- Korean
--   elseif lang == 'zh-cn' then return "应用于 NPC 治疗的 NPC 伤害乘数百分比（需要重新加载）" -- Simplified Chinese
--   elseif lang == 'ru-ru' then return "Процент множителя урона NPC, применяемый к исцелению NPC (требуется перезагрузка)" -- Russian
--   elseif lang == 'pt-br' then return "Porcentagem do multiplicador de dano do NPC aplicado à cura do NPC (requer recarga)" -- Brazilian Portuguese
--   elseif lang == 'jp-jp' then return "NPCヒーリングに適用されたNPCダメージ乗数のパーセンテージ（リロードが必要）" -- Japanese
--   elseif lang == 'zh-tw' then return "應用於 NPC 治療的 NPC 傷害乘數百分比（需要重新加載）" -- Traditional Chinese
--   elseif lang == 'ar-ar' then return "النسبة المئوية لمضاعف ضرر الشخصيات غير القابلة للعب المطبق على شفاء الشخصيات غير القابلة للعب (يتطلب إعادة التحميل)" -- Arabic
--   elseif lang == 'cz-cz' then return "Procento násobitele poškození NPC použitého na léčení NPC (vyžaduje opětovné načtení)" -- Czech
--   elseif lang == 'hu-hu' then return "Az NPC-sebzés szorzójának százalékos aránya az NPC-gyógyításra (újratöltés szükséges)" -- Hungarian
--   elseif lang == 'tr-tr' then return "NPC iyileştirmesine uygulanan NPC hasar çarpanının yüzdesi (yeniden yükleme gerektirir)" -- Turkish
--   elseif lang == 'th-th' then return "เปอร์เซ็นต์ของตัวคูณความเสียหาย NPC ที่ใช้ในการรักษา NPC (ต้องโหลดซ้ำ)" -- Thai
--   else return ""
--   end
-- end
