
//item types stored in high byte of item ID
enum DB_TYPE{
	DB_EMPTY, //No item ID
    DB_MISC, //Misc./Key/crafting item
    DB_ENTITY, //Player characters/NPC's/Enemies
    DB_SPELL, //Magic
    DB_UNK4,  //Unused
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
//set item ID by category and hex of low byte
#define ID(name,n) (DB_##name <<8|0x##n)
#define Misc(n) ID(MISC,n) //set hex of low byte
#define Ent(n) ID(ENTITY,n) //set hex of low byte
#define Spell(n) ID(SPELL,n) //set hex of low byte
#define Armor(n) ID(ARMOR,n) //set hex of low byte
#define Sheild(n) ID(SHEILD,n) //set hex of low byte
#define Weapon(n) ID(WEAPON,n) //set hex of low byte
#define Loot(n) ID(CHEST,n) //set hex of low byte
#define Helm(n) ID(HELMET,n) //set hex of low byte
#define Cloak(n) ID(CLOAK,n) //set hex of low byte
#define Glove(n) ID(GLOVE,n) //set hex of low byte
#define Ring(n) ID(RING,n) //set hex of low byte
#define Wand(n) ID(WAND,n) //set hex of low byte
#define Belt(n) ID(BELT,n) //set hex of low byte
#define Boot(n) ID(BOOTS,n) //set hex of low byte
#define Potion(n) ID(POTION,n) //set hex of low byte
#define Scroll(n) ID(SCROLL,n) //set hex of low byte
#define Key(n) ID(KEYITEM,n) //set hex of low byte
#define Medal(n) ID(AMULET,n) //set hex of low byte
#define DEnt(n) ID(DIALOUGEENTITY,n) //set hex of low byte

enum ItemIDS{
    //misc items

    Item_TxominLetter=Misc(0),
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
    Item_Map13, //Shouldd show region on pause map, but bugged not to.
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
    
    //Entites
    
    Ent_JundarMale=Ent(3),
    Ent_Guard1=Ent(6),
    Ent_Guard2=Ent(56),

    Ent_ChoasLt=Ent(c),
    Ent_ChoasMjr,


    Ent_Farris=Ent(99),
    Ent_Abrecan=Ent(3e),
    Ent_Alaron,
    Ent_Arturo,
    Ent_Baird,
    Ent_Becan,
    Ent_Brenna,
    Ent_Donovan=Ent(47),
    Ent_Dougal,
    Ent_Godric,
    Ent_Keelin,
    Ent_Niesen,
    Ent_Rheda,
    Ent_Sholeh,


    Ent_Shamsuk=Ent(13),
    Ent_Kitarak=Ent(1d),
    Ent_LizardBoss=Ent(1f),
    Ent_Marquis=Ent(21),
    Ent_Pochanargat=Ent(24),
    Ent_Shadow=Ent(26),
    Ent_Serridan=Ent(38),
    Ent_Firelord=Ent(61),
    Ent_Lugash,
    Ent_Skeleton,
    Ent_Wight,
    Ent_Wraith,
    Ent_Zombie,
    Ent_AirElem,

    Ent_DustDevil=Ent(6a),
    Ent_EarthElem,
    Ent_FireElem,
    
    Ent_StoneGolem=Ent(77),
    Ent_WaterElem,
    Ent_MinoLord=Ent(7f),
    Ent_SpiritWolf=Ent(87),
    Ent_GiantGolem=Ent(89),
    Ent_Golnar=Ent(94),
    Ent_SMehrdad,
    Ent_Shatrevar,
    Ent_Ksathra,




    //Potions
    //(NOTE: mind the captialization that differentiates it from the other potion enum)

    Potion_Fire=Potion(0),
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
    Potion_Defence,
    Potion_Steath,

    //Scrolls
    Scroll_SenseAura=Scroll(0),
    Scroll_Oriana,
    Scroll_Wind,
    Scroll_Endurance,
    Scroll_Weakness,
    Scroll_Teleport,
    Scroll_Strength=Scroll(7),
    Scroll_RemovePoison,
    Scroll_Lightning,
    Scroll_Immolation,
    Scroll_Escape=Scroll(c),
    Scroll_EarthSmite,
    Scroll_DragonFlames,
    Scroll_Debilitation,
    Scroll_ControlElem,
    Scroll_AirShield,
    Scroll_Lighthouse=Scroll(2e),


    //Key Items

    Key_Bowden=Key(0), //Unlocks door granting Trahern's Sword
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
    Amulet_Pandara=Medal(0),
    Amulet_Elisheva,
    Amulet_Shamsuk,
    Amulet_STGem,//Unused
    Amulet_Haste,
    Amulet_Shield,
    Amulet_Mirror,
    Amulet_Pork,
    Amulet_Marquis=Medal(9),


    //Dialouge Entities
    DEnt_Amann=DEnt(0),
    DEnt_Balfin,
    DEnt_Pillar=DEnt(3),
    DEnt_Cadme,
    DEnt_Cedric,
    DEnt_Pochanargat,
    DEnt_Fish=DEnt(28),
    DEnt_Flock,





    Item_NONE=-1 //item was not parsed correctly or desn't exist
};