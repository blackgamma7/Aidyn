
//item types stored in high byte of item ID
enum DB_TYPE{
	DB_EMPTY, //No item ID
    DB_MISC, //Misc./Key/crafting item
    DB_ENTITY, //Player characters/NPC's/Enemies
    DB_SPELL, //Magic
    DB_RITUAL,  //magic seen in early builds. Unused in final.
    DB_ARMOR, //Chest armor
    DB_SHIELD, 
    DB_WEAPON, 
    DB_CHEST, //loot pools for enemies and tresure
    DB_HELMET, //Head gear
    DB_CLOAK, //shoulder gear
    DB_GLOVE, //hand gear
    DB_RING,  //finger gear
    DB_WAND,  
    DB_BELT,  //waist gear
    DB_BOOTS, //foot gear
    DB_POTION, //flasks and potions
    DB_SCROLL, //learn magic
    DB_KEYITEM, //Key item
    DB_AMULET,  //chest gear
    DB_DIALOUGEENTITY //Simpler entities for dialouge (signs, animals)
};
//set item ID by category and low byte
#define IDSet(name,n) (n|(DB_##name <<8))
#define IDMisc(n) IDSet(MISC,n) 
#define IDEnt(n) IDSet(ENTITY,n) 
#define IDSpell(n) IDSet(SPELL,n) 
#define IDRite(n) IDSet(RITUAL,n) 
#define IDArmor(n) IDSet(ARMOR,n) 
#define IDShield(n) IDSet(SHEILD,n) 
#define IDWeapon(n) IDSet(WEAPON,n) 
#define IDChest(n) IDSet(CHEST,n) 
#define IDHelm(n) IDSet(HELMET,n) 
#define IDCloak(n) IDSet(CLOAK,n) 
#define IDGlove(n) IDSet(GLOVE,n) 
#define IDRing(n) IDSet(RING,n) 
#define IDWand(n) IDSet(WAND,n) 
#define IDBelt(n) IDSet(BELT,n) 
#define IDBoot(n) IDSet(BOOTS,n) 
#define IDPotion(n) IDSet(POTION,n) 
#define IDScroll(n) IDSet(SCROLL,n) 
#define IDKeyItem(n) IDSet(KEYITEM,n) 
#define IDMedal(n) IDSet(AMULET,n) 
#define IDDEnt(n) IDSet(DIALOUGEENTITY,n) 

#define IDEntInd(n) IDEnt(entityList[n])

enum ItemIDS{
    //misc items

    Item_TxominLetter=IDMisc(0),
    Item_Amaranth,
    Item_OrianaLetter,
    Item_KitarakLetter,
    Item_RabisatAsp,
    Item_Map1,
    Item_Map2, //reveals Erromon. Found in Gwernia stable
    
    //THERE IS NO MAP 3

    Item_Map4,
    Item_Map5,
    Item_Map6,
    Item_Map7,
    Item_Map8,
    Item_Map9,
    Item_Map10,
    Item_Sapphire,
    Item_Map11,
    Item_Sulphur, //unused item, can cause game to crash if loading description.
    Item_Spice, //component for spells and magic. found on Pepper plants
    Item_Herb, //component for spells and magic. found in clover patches
    Item_Gemstone, //component for spells and magic.
    Item_Map12,
    Item_Exp2, //unused
    Item_Exp3, //unused
    Item_Exp4, //unused
    Item_Exp5, //unused
    Item_CradawghBody,
    Item_Map13, //Should show region on pause map, but bugged not to. Cradawgh's Body does, instead.
    Item_Map14,
    Item_Map15,
    Item_Map16,
    Item_GoblinMap, //"Map to Goblin Lair". Unused
    Item_Map17,
    Item_Map18,
    Item_HellhoundHide,
    Item_DarkenbatHide,
    Item_BeastHide, //crafts Beast Hide armor
    Item_Chitlin,

    //headgear

    Helm_Kendal=IDHelm(0),
    Helm_Tempests,
    Helm_Defence,
    Helm_Wisdom,
    Helm_Charisma,
    Helm_Wizard,
    Helm_SpiritDrake=IDHelm(38),

    //cloaks

    Cloak_Leather=IDCloak(0),
    Cloak_Phantom,
    Cloak_Mirari,
    Cloak_Nightdrake=IDCloak(40),

    //gloves

    Glove_Healing=IDGlove(0),
    Glove_Tinker,
    Glove_Bard,
    Glove_Jundar,
    Glove_Plate,
    Glove_Stormdrake=IDGlove(41),

    //Rings

    Ring_Lunar=IDRing(8),
    Ring_Witch,
    Ring_Ether,
    Ring_Healing=IDRing(31),
    Ring_Magedrake=IDRing(39),
    Ring_Namer=IDRing(49),

    //Wands (and stuff that goes in the "Wands" slot)

    Wand_Banner=IDWand(0),
    Wand_MoonGem,
    Wand_Stormbreaker,
    Wand_HornKynon,
    Wand_HarpIgnore,
    Wand_VsStar,
    Wand_VsNecro,
    Wand_VsNaming,
    Wand_VsElement,
    Wand_TapStamina,
    Wand_Fireball,
    Wand_11, // unknown, omitted earlest available build.
    Wand_Gravity,
    Wand_Persuasion,
    Wand_Shielding,
    Wand_Light,
    Wand_Darkness,
    Wand_FrozenDoom,
    Wand_CrushingDeath,
    Wand_WebOfStarlight,
    Wand_Starfire,
    Wand_WraithTouch,
    Wand_Lightning,
    Wand_Acid,
    Wand_Immolation,
    Wand_Banishing,
    Wand_Revival,
    Wand_GemSensing,
    Wand_GemAspect,
    Wand_Rope,

    //belts

    Belt_Life=IDBelt(0),
    Belt_Teleport,
    Belt_Reflect,
    Belt_Mercenary=IDBelt(7),


    //boots

    Boot_Woodsman=IDBoot(0),
    Boot_Adamant,
    Boot_Leather=IDBoot(4),
    Boot_Striding,
    Boot_Speed=IDBoot(42),

    //Entites
    
    Ent_JundarMale=IDEnt(3),
    Ent_Guard1=IDEnt(6),
    Ent_Guard2=IDEnt(86),

    Ent_ChoasLt=IDEnt(12),
    Ent_ChoasMjr,


    Ent_Farris=IDEnt(153),
    Ent_Abrecan=IDEnt(62),
    Ent_Alaron,
    Ent_Arturo,
    Ent_Baird,
    Ent_Becan,
    Ent_Brenna,
    Ent_Donovan=IDEnt(66),
    Ent_Dougal,
    Ent_Godric,
    Ent_Keelin,
    Ent_Niesen,
    Ent_Rheda,
    Ent_Sholeh,


    Ent_Shamsuk=IDEnt(19),
    Ent_Kitarak=IDEnt(29),
    Ent_LizardBoss=IDEnt(31),
    Ent_Marquis=IDEnt(33),
    Ent_Pochanargat=IDEnt(36),
    Ent_Shadow=IDEnt(38),
    Ent_Serridan=IDEnt(56),
    Ent_Firelord=IDEnt(97),
    Ent_Lugash,
    Ent_Skeleton,
    Ent_Wight,
    Ent_Wraith,
    Ent_Zombie,
    Ent_AirElem,

    Ent_DustDevil=IDEnt(106),
    Ent_EarthElem,
    Ent_FireElem,
    
    Ent_StoneGolem=IDEnt(119),
    Ent_WaterElem,
    Ent_MinoLord=IDEnt(127),
    Ent_SpiritWolf=IDEnt(135),
    Ent_GiantGolem=IDEnt(137),
    Ent_Golnar=IDEnt(148),
    Ent_SMehrdad,
    Ent_Shatrevar,
    Ent_Ksathra,

    //Rituals (Omitted in final game, but listed for posterity.)
    
    Rite_Fog=IDRite(0), //Conjuring Fog
    Rite_Conjoining, // Conjoining
    Rite_Amulet,// Amulet Creation
    Rite_EnchantingShield,// Enchanting Shield
    Rite_04,// unknown, omitted in earlest available build.
    Rite_STGem,// Create ST Gem
    Rite_Hammer,// Rune Hammer
    Rite_Armor,// Enchanting Armor
    Rite_Sword,// Rune Sword
    Rite_Polearm,// Rune Pole Weapon
    Rite_Missle,// Rune Missile Weapon
    Rite_Wolf,// Summon Wolf
    Rite_Bear,// Summon Bear
    Rite_Elemental,// Summon Elemental

    //Potions
    //(NOTE: mind the captialization that differentiates it from the other potion enum)

    Potion_Fire=IDPotion(0),
    Potion_Inferno,
    Potion_Sleep,
    Potion_Acid,
    Potion_Healing,
    Potion_Stamina,
    Potion_Curing,
    Potion_Antidote,
    Potion_Restore,
    Potion_Strength,
    Potion_Dexterity,
    Potion_Aspect, //code changes into Healing potion if found
    Potion_Jumping,
    Potion_Clarity,
    Potion_Charisma,
    Potion_Defence,
    Potion_Steath,

    //Scrolls

    Scroll_SenseAura=IDScroll(0),
    Scroll_Oriana,
    Scroll_Wind,
    Scroll_Endurance,
    Scroll_Weakness,
    Scroll_Teleport,
    Scroll_6,//Unknown
    Scroll_Strength,
    Scroll_RemovePoison,
    Scroll_Lightning,
    Scroll_Immolation,
    Scroll_11,//Unknown
    Scroll_Escape,
    Scroll_EarthSmite,
    Scroll_DragonFlames,
    Scroll_Debilitation,
    Scroll_ControlElem,
    Scroll_AirShield,
    
    //scrolls 17-45 appear to be ommitted
    //from the earliest available build.
    //May have been the ritual scrolls?
    
    Scroll_Lighthouse=IDScroll(46),
    Scroll_47, //Unknown
    Scroll_48, //Unknown
    Scroll_49, //Unknown
    Scroll_Fireball,
    Scroll_AcidBolt,
    Scroll_AuraOfDeath,
    Scroll_SolarWrath,
    Scroll_Banishing,
    Scroll_Brilliance,
    Scroll_Charming,
    Scroll_CheatDeath,
    Scroll_Command,
    Scroll_ControlMarquis,
    Scroll_ControlZombie,
    Scroll_CrushingDeath,
    Scroll_Darkness,
    Scroll_DetectMoonPhase,
    Scroll_DetectSunPhase,
    Scroll_DetectChaos,
    Scroll_DetectTraps,
    Scroll_Dexterity,
    Scroll_DispelElemental,
    Scroll_DispelNaming,
    Scroll_DispelNecro,
    Scroll_DispelStar,
    Scroll_DispelClumsiness,
    Scroll_FrozenDoom,
    Scroll_Haste,
    Scroll_KnowAspect,
    Scroll_Light,
    Scroll_Mirror,
    Scroll_Stupidity,
    Scroll_Opening,
    Scroll_Photosynth,
    Scroll_ShieldStarlight,
    Scroll_Exhaustion,
    Scroll_ShieldSpirit,
    Scroll_Stamina,
    Scroll_Stealth,
    Scroll_StellarGrav,
    Scroll_TapStamina,
    Scroll_Teleportation,
    Scroll_VsElemental,
    Scroll_VsNaming,
    Scroll_VsNecro,
    Scroll_VsStar,
    Scroll_WallOfBones,
    Scroll_WebOfStarlight,
    Scroll_Whitefire,


    //Key Items

    Key_Bowden=IDKeyItem(0), //Unlocks door granting Trahern's Sword
    Key_Black,//unused, unique sprite
    Key_Skull,//unused, unique sprite
    Key_Blood,//unused, unique sprite
    Key_Bone,//unused, unique sprite
    Key_Lighthouse,
    Key_lodin,
    Key_Dragon,
    Key_17,//unused
    Key_16,//unused
    Key_15,//unused
    Key_14,//unused
    Key_13,//unused
    Key_12,//unused
    Key_11,//unused
    Key_10,//unused
    Key_9,//unused
    Key_8,//unused
    Key_7,//unused
    Key_6,//unused
    Key_5,//unused
    Key_4,//unused
    Key_3,//unused
    Key_2,//unused
    Key_1,//unused

    //Amulets
    Amulet_Pandara=IDMedal(0),
    Amulet_Elisheva,
    Amulet_Shamsuk,
    Amulet_STGem,//Unused. Would originally be made with Ritual magic
    Amulet_Haste,
    Amulet_Shield,
    Amulet_Mirror,
    Amulet_Pork,
    Amulet_08, //Unknown
    Amulet_Marquis,

    //loot pools (internally referred as "chests")

    Loot_Poor=IDChest(0),
    Loot_TypicalWarrior,
    Loot_LowWizard,
    Loot_HighWizard,
    Loot_ChoasDude,
    Loot_DropAll,
    Loot_MiddleClass,
    Loot_FairWealth,
    Loot_RichDude,
    Loot_HealthPak,
    Loot_Ehud,
    Loot_Kitarak,
    Loot_LizardBoss,
    //TODO: Finish

    //Dialouge Entities
    DEnt_Amann=IDDEnt(0),
    DEnt_Balfin,
    DEnt_Swagma,
    DEnt_Pillar,
    DEnt_Cadme,
    DEnt_Cedric,
    DEnt_Pochanargat,
    DEnt_Damek,
    DEnt_Darmath,
    DEnt_Devlin,
    DEnt_10, //Unknown
    DEnt_Esmerelda,
    DEnt_12,//Unknown
    DEnt_Fyrsil,
    DEnt_Gavinn,
    DEnt_Herne,
    DEnt_Honza,
    DEnt_17,//unknown.
    DEnt_Lycea,
    DEnt_Mago,
    DEnt_Meriona,
    DEnt_21,//Unknown.
    DEnt_Niala,
    DEnt_23, //unknown.
    DEnt_Tamberlain,
    DEnt_Xibid,
    DEnt_Batrin,
    DEnt_Cow,
    DEnt_Chicken,
    DEnt_Nurse,
    DEnt_Kolokos,
    DEnt_Gillek,
    DEnt_Jundargate,
    DEnt_Baldrik,
    DEnt_Bodecia,
    DEnt_KingdomSign,
    DEnt_MirariSign,
    DEnt_TerminorSign,
    DEnt_JundarSign,
    DEnt_Exponto,
    DEnt_Fish,
    DEnt_Flock,





    Item_NONE=-1 //item was not parsed correctly or desn't exist
};

//indecies of their order in the ROM databases. Used in GetIDIndex()

enum ItemInd{
    ItemInd_Cradawgh,
    ItemInd_Map18,
    ItemInd_Map17,
    ItemInd_Map16,
    ItemInd_Map15,
    ItemInd_Map14,
    ItemInd_Map13,
    ItemInd_Map12,
    ItemInd_Map11,
    ItemInd_Map10,
    ItemInd_Map9,
    ItemInd_Map8,
    ItemInd_Map7,
    ItemInd_Map6,
    ItemInd_Map5,
    ItemInd_Map4,
    ItemInd_Map2,
    ItemInd_Map1,
    ItemInd_Asp,
    ItemInd_LetterKitarak,
    ItemInd_LetterOriana,
    ItemInd_Amaranth,
    ItemInd_LetterTxomin,
    ItemInd_MapGoblin,
    ItemInd_exp5,
    ItemInd_exp4,
    ItemInd_exp3,
    ItemInd_exp2,
    ItemInd_Sapphire,
    ItemInd_Sulphur,
    ItemInd_Spice,
    ItemInd_Herb,
    ItemInd_Gemstone,
    ItemInd_HideHellhound,
    ItemInd_HideDarkenbat,
    ItemInd_HideBeast,
    ItemInd_HideChitlin,
    
    ItemInd_HelmCharisma,
    ItemInd_HelmWisdom,
    ItemInd_HelmDefence,
    ItemInd_HelmTempest,
    ItemInd_HelmKendal,
    ItemInd_HelmSpiritdrake,
    ItemInd_HelmWizard,

    ItemInd_CloakNightdrake,
    ItemInd_CloakLeather,
    ItemInd_CloakPhantom,
    ItemInd_CloakMirari,



    ItemInd_HornKynon=89,
};

enum EntInd{
    EntInd_Alaron=0x99,
    EndInd_Neilsen=162,
    EntInd_Sholeh=164,
    EndInd_Marquis=170,
    EntInd_Skeleton=187,
    EntInd_Shadow=0xac,
};