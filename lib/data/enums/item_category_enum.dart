enum ItemCategory {
  miscellaneous(0),
  ammo(1),
  arrows(2),
  bolts(3),
  constructionMaterials(4),
  constructionProducts(5),
  cookingIngredients(6),
  costumes(7),
  craftingMaterials(8),
  familiars(9),
  farmingProduce(10),
  fletchingMaterials(11),
  foodAndDrink(12),
  herbloreMaterials(13),
  huntingEquipment(14),
  huntingProduce(15),
  jewellery(16),
  mageArmour(17),
  mageWeapons(18),
  meleeArmourLow(19),
  meleeArmourMid(20),
  meleeArmourHigh(21),
  meleeWeaponsLow(22),
  meleeWeaponsMid(23),
  meleeWeaponsHigh(24),
  miningAndSmithing(25),
  potions(26),
  prayerArmour(27),
  prayerMaterials(28),
  rangeArmour(29),
  rangeWeapons(30),
  runecrafting(31),
  runesSpellsTeleports(32),
  seeds(33),
  summoningScrolls(34),
  toolsAndContainers(35),
  woodcuttingProduct(36),
  pocketItems(37),
  stoneSpirits(38),
  salvage(39),
  firemakingProducts(40),
  archaeologyMaterials(41),
  woodSpirits(42),
  necromancyArmour(43);

  final int code;

  const ItemCategory(this.code);

  static ItemCategory fromCode(int code) {
    return ItemCategory.values.firstWhere(
      (e) => e.code == code,
      orElse: () => throw ArgumentError('Invalid category code: $code'),
    );
  }
}
