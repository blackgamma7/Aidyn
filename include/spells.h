#include "itemInstances.h"

char** aspect_labels=NULL;
char** magic_school_labels=NULL;

typedef enum SpellEnum {
    SPELLIND_Immolation,
    SPELLIND_escape,
    SPELLIND_removePoison,
    SPELLIND_AirSheild,
    SPELLIND_ControlElem,
    SPELLIND_debilitation,
    SPELLIND_DragonFlames,
    SPELLIND_EarthSmite,
    SPELLIND_fireball,
    SPELLIND_lightning,
    SPELLIND_strength,
    SPELLIND_wind,
    SPELLIND_teleportation,
    SPELLIND_brilliance,
    SPELLIND_stupidity,
    SPELLIND_banishing,
    SPELLIND_charming,
    SPELLIND_controlMarquis,
    SPELLIND_detectingTraps,
    SPELLIND_endurance,
    SPELLIND_opening,
    SPELLIND_senseAura,
    SPELLIND_weakness,
    SPELLIND_cheatDeath,
    SPELLIND_AcidBolt,
    SPELLIND_auraOfDeath,
    SPELLIND_wraithTouch,
    SPELLIND_controlZombies,
    SPELLIND_crushingDeath,
    SPELLIND_darkness,
    SPELLIND_haste,
    SPELLIND_exhaustion,
    SPELLIND_stamina,
    SPELLIND_tapStamina,
    SPELLIND_wallOfBones,
    SPELLIND_spiritSheild,
    SPELLIND_poison,
    SPELLIND_mirror,
    SPELLIND_vsElemental,
    SPELLIND_vsNaming,
    SPELLIND_vsNecromancy,
    SPELLIND_vsStar,
    SPELLIND_dispelElemental,
    SPELLIND_dispelNaming,
    SPELLIND_dispelNecro,
    SPELLIND_dispelStar,
    SPELLIND_photosynthesis,
    SPELLIND_solarWraith,
    SPELLIND_starlightSheild,
    SPELLIND_detectMoonPhase,
    SPELLIND_detectSunPhase,
    SPELLIND_dexterity,
    SPELLIND_clumsiness,
    SPELLIND_frozenDoom,
    SPELLIND_light,
    SPELLIND_stealth,
    SPELLIND_stellarGravity,
    SPELLIND_webOfStarlight,
    SPELLIND_whitefire,
    SPELLIND_TOTAL,
    SPELLIND_NONE=-1
} SpellEnum;

typedef enum MagicSchoolEnum {
    SCHOOL_Chaos,
    SCHOOL_Elemental,
    SCHOOL_Naming,
    SCHOOL_Necromancy,
    SCHOOL_NONE,
    SCHOOL_Star
} MagicSchoolEnum;

typedef enum MagicCastedEnum {
    MCAST_SELF,
    MCAST_ONE,
    MCAST_ALL,
    MCAST_RANK
} MagicCastedEnum;

typedef enum MagicTargetEnum {
    MTarget_Field,
    MTarget_Party,
    MTarget_Enemy,
    MTarget_Area,
    MTarget_All
} MagicTargetEnum;

typedef enum MagicSpecial {
    Magic_TrueName=1,
    Magic_IsHeavy,
    Magic_SolarAspect,
    Magic_LunarAspect
} MagicSpecial;

typedef enum MagicCostEnum {
    SPELLUSE_NONE,
    SPELLUSE_Spice,
    SPELLUSE_Herb,
    SPELLUSE_Gemstone
} MagicCostEnum;
#pragma pack (push, 1) //struct is 1-byte aligned.
struct Spell_ROM { /* Spell Data in ROM */
    char Name[23];
    ItemID_ROM ID;
    u8 School;
    u8 Damage;
    u8 StaminaCost;
    u8 TargetAmmount;
    u8 Target;
    u8 unk0x1e; /* ram 0x1f */
    u8 WizardRequired;
    u8 Aspect;
    u8 Range;
    u8 Ingredient;
    u8 EXP_Modifyer;
};
#pragma pack(pop)

struct Spell_RAM {
    ItemID Id;
    char Name[24];
    u8 School;
    u8 Damage;
    u8 stamina;
    u8 CastedMagic;
    u8 Target;
    u8 unk0x1f;
    u8 WizardREQ;
    u8 Aspect;
    u8 Range;
    u8 ingredient;
    u8 EXP_Modifyer;
    undefined field13_0x25;
};


namespace TempSpell{
    void Init(SpellInstance *,ItemID ,u8);
    s32 GetExpPrice(SpellInstance *);
    s32 GetGoldPrice(SpellInstance *);
    ItemID GetIngredient(SpellInstance *);
    u8 IsBattleSpell(SpellInstance *);
    u8 Ret1(SpellInstance *);
    u8 IsMaxRank(SpellInstance *);  
};
namespace TempEnchant{
    void Init(Temp_enchant*,u8,byte,u32,u8,u32);
    void StopSpellVisual(Temp_enchant *);
    u8 IncTimer(Temp_enchant *,u16 ,int );
};

void malloc_equip_spell(SpellCharges *,u8 ,u8 ,u8 );
void Ofunc_80084200(SpellInstance **);

class SpellBook {
    public:
    SpellInstance ** spells;
    u8 count;
    void Reset(u8);
    void NewSpell(ItemID,u8);
    u8 HaveSpell(ItemID ,u8 *);
    void Clear();
};

class SpellDB {
    public;
    u8 Total;
    u8 Schools[6];
    u8 schools2[6];
    u8 field3_0xd[3];
    Spell_RAM *spells;
    void Orphaned();
    void Load(u8 index,u32 *pos);
    void Init();
    void Free();
    u8 GetIcon(ItemID);

};

extern SpellDB* gSpellDBp;