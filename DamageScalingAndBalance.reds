module DamageScalingAndBalance;

import gamedataWeaponType;
import gamedataDamageType;
import gamedataAttackType;
import TweakDB;
import ItemID;

// ------------------------------------------------------------------------
// 1) CLASS: PRESERVE EXISTING + ADD RANGED/THROWABLE/ELEMENTAL
// ------------------------------------------------------------------------
class DamageScalingAndBalance {
  public static func StaminaCostMultiplier() -> Float = 1.0;
  public static func HeadshotMultiplier() -> Float = 1.0;
  public static func QuickhackDamageMultiplier() -> Float = 1.0;
  public static func MechanicalDamageMultiplier() -> Float = 1.0;
  public static func GrenadeDamageMultiplier() -> Float = 1.0;
  public static func NpcMeleeDamageMultiplier() -> Float = 1.0;
  public static func PlayerMeleeDamageMultiplier() -> Float = 1.0;

  // Ranged Categories
  public static func PistolDamageMultiplier() -> Float = 1.0;
  public static func RevolverDamageMultiplier() -> Float = 1.0;
  public static func SMGDamageMultiplier() -> Float = 1.0;
  public static func LMGDamageMultiplier() -> Float = 1.0;
  public static func AssaultRifleDamageMultiplier() -> Float = 1.0;
  public static func PrecisionRifleDamageMultiplier() -> Float = 1.0;
  public static func SniperRifleDamageMultiplier() -> Float = 1.0;
  public static func ShotgunDamageMultiplier() -> Float = 1.0;

  // Throwable + Elemental
  public static func ThrowableMeleeDamageMultiplier() -> Float = 1.0;
  public static func ElementalDamageMultiplier() -> Float = 1.0;
}; // Semicolon after class brace

// ------------------------------------------------------------------------
// 2) GLOBAL HELPERS: THROWN CHECK & WEAPON TYPE VIA TWEAKDB
// ------------------------------------------------------------------------
public func IsThrownWeapon(weapon: wref<WeaponObject>) -> Bool {
  if !IsDefined(weapon) {
    return false;
  };
  return weapon.HasTag(n"ThrownWeapon");
};

public func GetWeaponTypeFromTweakDB(weapon: wref<WeaponObject>) -> gamedataWeaponType {
  if !IsDefined(weapon) {
    return gamedataWeaponType.Invalid;
  };
  let itemID: ItemID = weapon.GetItemID();
  let recordID: TweakDBID = TDBID.Create(GetID(itemID));
  let itemRecord: wref<Item_Record> = TweakDB.GetItemRecord(recordID);
  if !IsDefined(itemRecord) {
    return gamedataWeaponType.Invalid;
  };
  let weaponRecord: wref<WeaponItem_Record> = itemRecord as WeaponItem_Record;
  if !IsDefined(weaponRecord) {
    return gamedataWeaponType.Invalid;
  };
  return weaponRecord.WeaponType();
};

// ------------------------------------------------------------------------
// 3) PRESERVE WRAPS FOR STAMINA, HEADSHOT
// ------------------------------------------------------------------------
@wrapMethod(PlayerStaminaHelpers)
public final static func ModifyStamina(player: ref<PlayerPuppet>, delta: Float, opt perc: Bool) -> Void {
  wrappedMethod(player, delta * DamageScalingAndBalance.StaminaCostMultiplier(), perc);
};

@wrapMethod(DamageSystem)
protected final func GetHeadshotDamageModifier(statSystem: ref<StatsSystem>, attackData: ref<AttackData>) -> Float {
  let mult: Float = 1.0;
  if IsDefined(attackData.GetInstigator() as PlayerPuppet) {
    mult = DamageScalingAndBalance.HeadshotMultiplier();
  };
  return wrappedMethod(statSystem, attackData) * mult;
};

// ------------------------------------------------------------------------
// 4) EXTEND ProcessQuickHackModifiers (OUR MAIN HOOK)
// ------------------------------------------------------------------------
@wrapMethod(DamageSystem)
private final func ProcessQuickHackModifiers(hitEvent: ref<gameHitEvent>) -> Void {
  wrappedMethod(hitEvent);

  let playerInstigator: wref<PlayerPuppet> = hitEvent.attackData.GetInstigator() as PlayerPuppet;
  if IsDefined(playerInstigator) {
    if !hitEvent.target.IsPuppet() {
      return;
    };

    // Quickhack
    if Equals(hitEvent.attackData.GetAttackType(), gamedataAttackType.Hack) {
      hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.QuickhackDamageMultiplier());
    };

    // Mechanical
    if IsDefined(hitEvent.target as ScriptedPuppet) && (hitEvent.target as ScriptedPuppet).IsMechanical() {
      hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.MechanicalDamageMultiplier());
    };

    // Grenade
    if IsDefined(hitEvent.attackData.GetSource() as WeaponGrenade) {
      hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.GrenadeDamageMultiplier());
    };

    let weapon: wref<WeaponObject> = hitEvent.attackData.GetWeapon();
    if IsDefined(weapon) {
      // 1) Thrown?
      if IsThrownWeapon(weapon) {
        hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.ThrowableMeleeDamageMultiplier());
      } else {
        let atkType: gamedataAttackType = hitEvent.attackData.GetAttackType();
        // 2) Standard melee or whip
        if AttackData.IsMelee(atkType) || AttackData.IsWhip(atkType) {
          hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.NpcMeleeDamageMultiplier());
        } else {
          // 3) Otherwise treat as ranged
          let weapType: gamedataWeaponType = GetWeaponTypeFromTweakDB(weapon);
          switch weapType {
            case gamedataWeaponType.Pistol:
              hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.PistolDamageMultiplier());
              break;
            case gamedataWeaponType.Revolver:
              hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.RevolverDamageMultiplier());
              break;
            case gamedataWeaponType.SMG:
              hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.SMGDamageMultiplier());
              break;
            case gamedataWeaponType.MachineGun:
              hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.LMGDamageMultiplier());
              break;
            case gamedataWeaponType.AssaultRifle:
              hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.AssaultRifleDamageMultiplier());
              break;
            case gamedataWeaponType.PrecisionRifle:
              hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.PrecisionRifleDamageMultiplier());
              break;
            case gamedataWeaponType.SniperRifle:
              hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.SniperRifleDamageMultiplier());
              break;
            case gamedataWeaponType.Shotgun:
              hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.ShotgunDamageMultiplier());
              break;
            default:
              break;
          };
        };
      };
    };

    let dmgType: gamedataDamageType = hitEvent.attackData.GetDamageType();
    if dmgType != gamedataDamageType.Physical {
      hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.ElementalDamageMultiplier());
    };
    return;
  };

  let playerTarget: wref<PlayerPuppet> = hitEvent.target as PlayerPuppet;
  if IsDefined(playerTarget) {
    let atkTypeNPC: gamedataAttackType = hitEvent.attackData.GetAttackType();
    if AttackData.IsMelee(atkTypeNPC) || AttackData.IsWhip(atkTypeNPC) {
      let npcWeapon: wref<WeaponObject> = hitEvent.attackData.GetWeapon();
      if IsDefined(npcWeapon) && IsThrownWeapon(npcWeapon) {
        hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.ThrowableMeleeDamageMultiplier());
      } else {
        hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.PlayerMeleeDamageMultiplier());
      };
    };
  };
}; // End of ProcessQuickHackModifiers
