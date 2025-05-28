module DamageScalingAndBalance

class DamageScalingAndBalance {
  public static func StaminaCostMultiplier() -> Float = 1.0
  public static func HeadshotMultiplier() -> Float = 1.0
  public static func QuickhackDamageMultiplier() -> Float = 1.0
  public static func MechanicalDamageMultiplier() -> Float = 1.0
  public static func GrenadeDamageMultiplier() -> Float = 1.0
  public static func NpcMeleeDamageMultiplier() -> Float = 1.0
  public static func PlayerMeleeDamageMultiplier() -> Float = 1.0
}

@wrapMethod(PlayerStaminaHelpers)
public final static func ModifyStamina(player: ref<PlayerPuppet>, delta: Float, opt perc: Bool) -> Void {
  wrappedMethod(player, delta * DamageScalingAndBalance.StaminaCostMultiplier(), perc);
}

@wrapMethod(DamageSystem)
protected final func GetHeadshotDamageModifier(statSystem: ref<StatsSystem>, attackData: ref<AttackData>) -> Float {
  let mult: Float = 1.0;
  if IsDefined(attackData.GetInstigator() as PlayerPuppet) {
    mult = DamageScalingAndBalance.HeadshotMultiplier();
  }
  return wrappedMethod(statSystem, attackData) * mult;
}

@wrapMethod(DamageSystem)
private final func ProcessQuickHackModifiers(hitEvent: ref<gameHitEvent>) -> Void {
  wrappedMethod(hitEvent);

  let playerInstigator: wref<PlayerPuppet> = hitEvent.attackData.GetInstigator() as PlayerPuppet;
  if IsDefined(playerInstigator) {
    if !hitEvent.target.IsPuppet() {
      return;
    }

    if Equals(hitEvent.attackData.GetAttackType(), gamedataAttackType.Hack) {
      hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.QuickhackDamageMultiplier());
    }

    // add in mechanical here even though this is a quickhack function. This is just before one shot protection, so it's a good spot.
    if IsDefined(hitEvent.target as ScriptedPuppet) && hitEvent.target as ScriptedPuppet.IsMechanical() {
      hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.MechanicalDamageMultiplier());
    }

    if IsDefined(hitEvent.attackData.GetSource() as WeaponGrenade) {
      hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.GrenadeDamageMultiplier());
    }

    if AttackData.IsMelee(hitEvent.attackData.GetAttackType()) || AttackData.IsWhip(hitEvent.attackData.GetAttackType()) {
      hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.NpcMeleeDamageMultiplier());
    }
    return;
  }

  let playerTarget: wref<PlayerPuppet> = hitEvent.target as PlayerPuppet;
  if IsDefined(playerTarget) {
    if AttackData.IsMelee(hitEvent.attackData.GetAttackType()) || AttackData.IsWhip(hitEvent.attackData.GetAttackType()) {
      hitEvent.attackComputed.MultAttackValue(DamageScalingAndBalance.PlayerMeleeDamageMultiplier());
    }
  }
}
