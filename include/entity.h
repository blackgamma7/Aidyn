#include "CharStats.h"
#include "CharSkills.h"
#include "itemInstances.h"
#include "spells.h"
#include "potion.h"

enum ENTITY_CATEGORY{
    ENTITY_GENERIC,
    ENTITY_HUMANOID,
    ENTITY_NAMED,
    ENTITY_PARTY,
    ENTITY_CHAOS,
    ENTITY_NATURAL
    };


struct Entity_ROM { /* Entity data stored in Rom */
    char name[20];
    char internalName[20];
    u8 category; /* only checks for Chaos type */
    ItemID_ROM id;
    u8 unk0x2b; /* passed to ram 0x19 */
    enum AspectEnum Aspect;
    u8 trueName;
    u8 Heavy;
    u8 Alchemist; /* base skill lv's */
    u8 Diplomat; /* FF=Cannot learn */
    u8 Healer;
    u8 Loremaster;
    u8 Mechanic;
    u8 Merchant;
    u8 Ranger;
    u8 Stealth;
    u8 Theif;
    u8 Troubador;
    u8 Warrior;
    u8 Wizard;
    u8 Bite;
    u8 Breath;
    u8 Claw;
    u8 Hafted;
    u8 Missle;
    u8 Pole;
    u8 Spit;
    u8 Sting;
    u8 Sword;
    u8 Throw;
    u8 Tusk;
    u8 Intelligence; /* base Stat lv's */
    u8 Willpower;
    u8 Dexterity;
    u8 Endurance;
    u8 Strength;
    u8 Stamina;
    u8 morale;
    u8 Level;
    u8 unk0x4e;
    ItemID_ROM Weapons[3]; /* Endian swapped */
    u8 unk0x55;
    u8 unk0x56;
    ItemID_ROM spells[5]; /* endian Swapped */
    enum MagicSchoolEnum MagicSchool; /* Chaos=All Schools */
    u8 spell_levels[5];
    u8 unk0x67[9];
    ItemID_ROM Armor;
    u8 protection;
    ItemID_ROM sheild;
    u8 SheildSkill;
    enum ElementEnum ElementResist1;
    u8 ResistAmmount1; /* 100-(25*x) */
    enum ElementEnum ElementResist2;
    u8 ResistAmmount2; /* 100-(25*x) */
    u8 unk0x7a[8];
    u8 unk0x82[4];
    u8 EXP_X75; /* x50, then 1.5 on EXP func */
    u8 LootCategory;
};

struct Entity_Ram { /* entity data in Ram */
    ItemID ID;
    char Name[21];
    u8 Category;
    u8 unk0x18; /* 2 bits determined by rom0x2d */
    u8 rom0x2b;
    u8 aspect;
    u8 morale; //determines how likely enemies are to flee batte
    u8 Level;
    u8 BaseDamage; /* rom0x4d */
    u8 School;
    u8 BaseProtect; /* sheild related? */
    u8 unk0x20; //deals with monster "vision." 10 or 0.
    u8 unk0x21;
    u8 Skills[12];
    u8 weaponProf[11];
    u8 stats[7];
    ItemID weapon[3];
    ItemID spells[5];
    u8 Spell_levels[5];
    u8 unk0x55[5]; // rom0x68. Unused
    u8 unk0x5a[4]; // rom0x6d. Unused.
    ItemID Armor;
    ItemID Sheild;
    s8 sheildStat;
    u8 Resist[2];
    u8 align[3];
    float resistAmmount[2];
    u16 ritualIDs[4]; //originally starting "Rituals". unused in final game
    u8 RiualLvs[4]; //originally starting "Rituals". unused in final game
    u16 EXP;
    u8 loot_Category;
    u8 unk0x7f;
};

struct entity_info{
	u16 index;
	u32 Model; //index of "borg7 file.
	u32 portrait; //index of "borg8" file.
	float a;
	float b;
	float c;
	float scale; 
};

struct dialougeEntity_Info { /* extended data of Dialouge entities in RAM */
    u16 index;
    u32 model;
    u32 portrait;
    float a;
    float b;
};

struct resist_float { /* resistance and element when loaded into temp item */
    u8 element;
    float percent;
};

typedef enum CharSheetFlags {
    CHAR_TrueName=1,
    CHAR_IsHeavy=2,
    CHAR_IsSolar=4 //false for lunar aspect.
} CharSheetFlags;

class CharExp { /* data containing EXP, School, Aspect and more. */
    public:
    u8 rom0x2b; /* Ent_rom data 0x2b. seems unused */
    u8 school;
    u8 protection;
    u8 damage; //effected by equipment, unused in battle calculation?
    uint total; /* for level up */
    uint spending; /* for training */
    u8 flags; // true name, heavy, aspect
    void Init(ItemID);
    u8 GetAspect();
};




#define GEARTOTAL 12
struct CharGear {
    GearInstance **pItem;
    u8 usedItems;
    u8 maxItems;
};

#define MAGIC_FXMAX 15
#define POTION_FXMAX 7
struct CharSheet { /* Skills, stats and misc of Characters */
    ItemID ID;
    char *name; /* pointer to entityDB entry */
    u8 unk0x8[12]; //unused
    CharExp *EXP;
    CharStats_s *Stats; /* base and modded stats of character */
    CharSkills *Skills; /* skill and weapon levels */
    ArmorInstance **armor;
    WeaponInstance *weapons;
    CharGear *pItemList;
    SpellBook *spellbook; /* list and count of known spells */
    void* unk0x30; //may have been for "Rituals" unused in final game
    Temp_enchant** effects;
    PotionEffect** potionEffects; //potion effects on character
    s8 spellVal;
    u8 spellSwitch;
    u8 currSpell;
    u32 unk0x40;
    Borg8header *portrait;
};

class EntityDB {
    public:
    u8 total;
    u8 catSizes[7];
    u8 unk[7];
    struct Entity_Ram *entities;
    void OldInit();
    void Load(u8,s32 *);
    void Init();
    void Free();
    u32 GetPortrait(ItemID);
    u32 GetBorg7(ItemID);
    char* GetEntityName(ItemID);
    float GetPerception(ItemID);
    float GetVal_21h(ItemID);
    float GetHeight(ItemID);
    float GetHeightMinPoint2(ItemID);
    float GetHeightplusPoint35(ItemID);
    u8 BattleCheck(ItemID);
    float GetFloatA(ItemID);
    float RetPoint4(ItemID);
    u8 IsNotBoss(ItemID);
    float GetFloatC(ItemID);
    float GetScale(ItemID);
};

extern entity_info entity_info_array[222]; //organized alphabetically for some reason.
extern dialougeEntity_Info dailougEnt_info_array[32]; //same with this.
extern EntityDB* gEntityDB;
extern u8 entityList[221];

extern struct CombatEntity;

namespace Entity{
    u8 IsElemental(ItemID param_1);
    void EquipFunc0(CharSheet *param_1,Entity_Ram *param_2);
    void EquipFunc1(CharSheet *param_1,Entity_Ram *param_2);
    void EquipFunc2(CharSheet *param_1,Entity_Ram *param_2);
    void Init(CharSheet *param_1,ItemID param_2,u8 param_3);
    void Free(CharSheet *param_1);
    u8 getHPMax(CharSheet *param_1);
    u32 getHPCurrent(CharSheet *param_1);
    float getHPPercent(CharSheet *param_1);
    u8 isDead(CharSheet *param_1);
    void DecreaseHP(CharSheet *param_1,s16 dmg);
    u8 hasCheatDeath(CharSheet *param_1);
    void DamageToLevel(CharSheet *ent,s16 param_2,CombatEntity *cEnt);
    void addHP(CharSheet *param_1,u16 param_2);
    void addStamina(CharSheet *param_1,u8 pointEight);
    u8 ret0(CharSheet *param_1);
    u8 NoSheildSkill(CharSheet *param_1);
    u8 canEquipWeapon(CharSheet *param_1,ItemID param_2);
    s32 GearMinStatCheck(CharSheet *param_1,ItemID param_2);
    void EquipArmor(CharSheet *param_1,u16 param_2,StatMod* param_3);
    u8 EquipSheild(CharSheet *param_1,u16 param_2,StatMod* param_3);
    u8 EquipWeapon(CharSheet *param_1,u16 param_2,StatMod* param_3);
    u32 EquipGear(CharSheet *chara,ItemID param_2,StatMod *mod);
    void ApplyEquipment(CharSheet *param_1,WeaponInstance *param_2,StatMod *param_3,int param_4);
    void EquipArmorOrShield(CharSheet *param_1,ItemID id,StatMod *param_3,u8 sheild);
    void RemoveArmor(CharSheet *param_1);
    void RemoveShield(CharSheet *param_1);
    void RemoveArmorOrShield(CharSheet *param_1,int param_2);
    void UnequipWeapons(CharSheet *param_1);
    void UnequipGear(CharSheet *param_1,u8 slot);
    void UnequipAll(CharSheet *param_1);
    u8 HasPotionEffect(CharSheet *param_1,u8 id);
    void ApplyPotionEffect(CharSheet *chara,u8 pot,u8 pow,u32 time);
    void ReversePotionEffect(CharSheet *param_1,u8 param_2);
    u8 IncPotionEffect(CharSheet *param_1,u8 noCombat,uint delta);
    void RemovePotion(CharSheet *ent,u8 slot);
    void StaminaPotion(CharSheet *param_1);
    u8 CanUsePotion(CharSheet *param_1,u8 param_2,char *param_3);
    u8 UsePotion(CharSheet *param_1,u8 param_2,u8 param_3,char *param_4);
    u8 HasSpellEffect(CharSheet *param_1,u8 id);
    s32 FindFreeEffect(CharSheet *param_1);
    short ApplySpellEffect(CharSheet *param_1,u8 id,u8 Level,uint timer,byte pow,CombatEntity *combatTarget);
    void ReverseSpellEffect(CharSheet *target,u8 index,CombatEntity *combatEnt);
    s32 IncEnchantments(CharSheet *param_1,CombatEntity *param_2,s32 param_3);
    SpellInstance* getSpell(CharSheet *param_1);
    SpellInstance* getSpellSafe(CharSheet *param_1,u32 unk1,u32 unk2);
    u8 GetSpellCharges(CharSheet *param_1);
    void DecSpellCharge(CharSheet *param_1);
    u8 CheckSpellWizard(CharSheet *param_1,SpellInstance *param_2);
    s32 SpellStaminaSubtract(CharSheet* param_1,SpellInstance *spell,u8 param_2);
    u8 TestEquipStamina(CharSheet *param_1,s16 param_2);
    int EquipStamina(CharSheet *param_1,short stam,u8 param_3);
    s16 AddEquipStamina(CharSheet *param_1,ItemInstance *param_2,short param_3,u8 param_4);
    void CampHeal(CharSheet *param_1,float healing,uint time);
    u8 CheckSpellTimeOfDay(CharSheet *param_1,SpellInstance *param_2);
    byte CheckSpellSpecial(CharSheet *param_1,SpellInstance *param_2);
    void CheckDeathFromDoT(CharSheet *param_1,s16 param_2,s16 param_3,CombatEntity *param_4);
    void IncEffects(CharSheet *Ent,CombatEntity *CEnt,uint Delta);
    void AddExp(CharSheet *param_1,s32 param_2);
    void ModExpTotal(CharSheet *param_1,s32 param_2);
    u16 HealByPotion(CharSheet *param_1,u16 Hi,u16 Lo);
    void RemoveAllEffects(CharSheet *param_1);
    void ClearAllPotionEffects(CharSheet *param_1);
    u32 GetLevel(CharSheet *param_1);
    s32 GetEXPTNL(CharSheet *param_1);
    void ResetEffects(CharSheet *param_1);
    void ApplyEquipEffect(CharSheet *param_1,WeaponInstance *param_2);
    void Teleport(CharSheet* ch,CombatEntity *param_1);
    void RemovePoison(CharSheet *charSheet,CombatEntity *ent,u8 pow);
    void WraithTouch(CharSheet *param_1,CombatEntity* cEnt,u8 num,u8 slot);
    void DarknessLightMagic(CharSheet *param_1,u8 param_2);
    u8 DispelMagic(CharSheet *param_1,CombatEntity* param_2,u8 param_3,u8 param_4);
    void DoubleTap(CharSheet *param_1);
    u8 HealHandsCheck(CharSheet *param_1);
    u8 HealHerbsCheck(CharSheet *param_1);
    u8 TroubadorCheck(CharSheet *param_1);
    void AllocEnchant(CharSheet *param_1,u8 param_2,u8 param_3,u8 param_4,u32 timer,s32 param_6);
    void EffectModStats(CharSheet *param_1,u8 param_2,u8 param_3);
    void RemoveStatBuff(CharSheet *param_1,u8 param_2,u8 param_3);
    void ClearSpellEffect(CharSheet *param_1,u8 index,CombatEntity *param_3);
    u8 IsDebuffSpell(CharSheet* c,SpellEnum spell);
    u8 GetShieldDefence(CharSheet *param_1,ItemID param_2);
    int GetArmorProtect(CharSheet *param_1,ItemID param_2);
};
char** Spell_error_labels=NULL;
extern u32 EXP_TNL[];
//TODO: define in "Entity" namespace
void FUN_80078874(CharSheet *param_1,WeaponInstance *param_2,u8 param_3);
s32 print_element_resist(resist_float *param_1,char *param_2,char *param_3,u32 param_4);
void senseAura(CombatEntity *target,u8 level);
