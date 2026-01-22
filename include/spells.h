#include "itemInstances.h"

char** aspect_labels=NULL;
char** magic_school_labels=NULL;
extern u8 SpellList[];

typedef enum SpellEnum {
    SPELLIND_Immolation,
    SPELLIND_Escape,
    SPELLIND_RemovePoison,
    SPELLIND_AirShield,
    SPELLIND_ControlElem,
    SPELLIND_debilitation,
    SPELLIND_DragonFlames,
    SPELLIND_EarthSmite,
    SPELLIND_Fireball,
    SPELLIND_Lightning,
    SPELLIND_Strength,
    SPELLIND_Wind,
    SPELLIND_Teleportation,
    SPELLIND_Brilliance,
    SPELLIND_Stupidity,
    SPELLIND_Banishing,
    SPELLIND_Charming,
    SPELLIND_ControlMarquis,
    SPELLIND_detectingTraps,
    SPELLIND_Endurance,
    SPELLIND_Opening,
    SPELLIND_SenseAura,
    SPELLIND_Weakness,
    SPELLIND_CheatDeath,
    SPELLIND_AcidBolt,
    SPELLIND_AuraOfDeath,
    SPELLIND_WraithTouch,
    SPELLIND_ControlZombies,
    SPELLIND_CrushingDeath,
    SPELLIND_Darkness,
    SPELLIND_Haste,
    SPELLIND_Exhaustion,
    SPELLIND_Stamina,
    SPELLIND_tapStamina,
    SPELLIND_WallOfBones,
    SPELLIND_SpiritShield,
    SPELLIND_Poison,
    SPELLIND_Mirror,
    SPELLIND_VsElemental,
    SPELLIND_VsNaming,
    SPELLIND_VsNecromancy,
    SPELLIND_VsStar,
    SPELLIND_DispelElemental,
    SPELLIND_DispelNaming,
    SPELLIND_DispelNecro,
    SPELLIND_DispelStar,
    SPELLIND_Photosynthesis,
    SPELLIND_SolarWrath,
    SPELLIND_StarlightShield,
    SPELLIND_DetectMoonPhase,
    SPELLIND_DetectSunPhase,
    SPELLIND_Dexterity,
    SPELLIND_Clumsiness,
    SPELLIND_FrozenDoom,
    SPELLIND_Light,
    SPELLIND_Stealth,
    SPELLIND_StellarGravity,
    SPELLIND_WebOfStarlight,
    SPELLIND_Whitefire,
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
    MTarget_Field, //only useable outside battle
    MTarget_Party, //only used on party members or charmed enemies
    MTarget_Enemy, //only used on enemies
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

struct SpellRAM {
    ItemID Id;
    char name[24];
    u8 school;
    u8 damage;
    u8 stamina;
    u8 CastedMagic;
    u8 target;
    u8 unk0x1f;
    u8 wizard;
    u8 Aspect;
    u8 range;
    u8 ingredient;
    u8 expMod;
    u8 field13_0x25;
};

//combine as class with SpellInstance?
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
    public:
    u8 Total;
    u8 Schools[6];
    u8 schools2[6];
    u8 field3_0xd[3];
    SpellRAM *spells;
    void Orphaned();
    void Load(u8 index,u32 *pos);
    void Init();
    void Free();
    u8 GetIcon(ItemID);

};

extern SpellDB* gSpellDBp;