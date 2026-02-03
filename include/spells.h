#include "itemInstances.h"

char** aspect_labels=NULL;
char** magic_school_labels=NULL;
extern u8 SpellList[];

typedef enum SpellEnum {
    SpellInd_Immolation,
    SpellInd_Escape,
    SpellInd_RemovePoison,
    SpellInd_AirShield,
    SpellInd_ControlElem,
    SpellInd_debilitation,
    SpellInd_DragonFlames,
    SpellInd_EarthSmite,
    SpellInd_Fireball,
    SpellInd_Lightning,
    SpellInd_Strength,
    SpellInd_Wind,
    SpellInd_Teleportation,
    SpellInd_Brilliance,
    SpellInd_Stupidity,
    SpellInd_Banishing,
    SpellInd_Charming,
    SpellInd_ControlMarquis,
    SpellInd_detectingTraps,
    SpellInd_Endurance,
    SpellInd_Opening,
    SpellInd_SenseAura,
    SpellInd_Weakness,
    SpellInd_CheatDeath,
    SpellInd_AcidBolt,
    SpellInd_AuraOfDeath,
    SpellInd_WraithTouch,
    SpellInd_ControlZombies,
    SpellInd_CrushingDeath,
    SpellInd_Darkness,
    SpellInd_Haste,
    SpellInd_Exhaustion,
    SpellInd_Stamina,
    SpellInd_tapStamina,
    SpellInd_WallOfBones,
    SpellInd_SpiritShield,
    SpellInd_Poison,
    SpellInd_Mirror,
    SpellInd_VsElemental,
    SpellInd_VsNaming,
    SpellInd_VsNecromancy,
    SpellInd_VsStar,
    SpellInd_DispelElemental,
    SpellInd_DispelNaming,
    SpellInd_DispelNecro,
    SpellInd_DispelStar,
    SpellInd_Photosynthesis,
    SpellInd_SolarWrath,
    SpellInd_StarlightShield,
    SpellInd_DetectMoonPhase,
    SpellInd_DetectSunPhase,
    SpellInd_Dexterity,
    SpellInd_Clumsiness,
    SpellInd_FrozenDoom,
    SpellInd_Light,
    SpellInd_Stealth,
    SpellInd_StellarGravity,
    SpellInd_WebOfStarlight,
    SpellInd_Whitefire,
    SpellInd_TOTAL,
    SpellInd_NONE=-1
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
    void Init(Temp_enchant*,u8,u8,u32,u8,u32);
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