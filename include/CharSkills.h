#include "itemID.h"
#include "savefiles.h"

enum WeaponClassEnum {
    WEAPON_Bite,
    WEAPON_Breath,
    WEAPON_Claw,
    WEAPON_Hafted,
    WEAPON_Missle,
    WEAPON_Pole,
    WEAPON_Spit,
    WEAPON_Sting,
    WEAPON_Sword,
    WEAPON_Thrown,
    WEAPON_Tusk,
    WEAPON_Total
} ;

enum SkillEnum {
 	SKILL_Alchemist, SKILL_Diplomat, SKILL_Healer, SKILL_Loremaster,
    SKILL_Mechanic, SKILL_Merchant, SKILL_Ranger, SKILL_Stealth,
    SKILL_Theif, SKILL_Troubador, SKILL_Warrior, SKILL_Wizard, 
    SKILL_Total,SKILL_NONE=255
};

#define SKILLCOUNT SKILL_Total
#define WEAPONCOUNT WEAPON_Total
#define SKILLMAXBASE 10
#define SKILLMAXMOD 15

class CharSkills { /* Skill and weapon levels. Also sheild. */
   public: 
    s8 SkillBase[SKILLCOUNT];
    s8 WeaponBase[WEAPONCOUNT];
    s8 ShieldBase;
    s8 SkillModded[SKILLCOUNT];
    s8 WeaponModded[WEAPONCOUNT];
    s8 ShieldModded;
    public:
    void Init(ItemID);
    void Save(SaveFile*);
    void Copy(CharSkills*);
    u8 LoadOne(SaveFile *,s8);
    void LoadAll(SaveFile *);
    u32 GetSkillXpMod(u8);
    u32 GetWeaponXpMod(u8);
    u32 GetShieldXpPrice();
    u32 GetGoldTrainPrice(u8);
    u32 GetWeaponGoldTrainPrice(u8);
    u32 GetShieldGoldTrainPrice();
    void AddToBaseSkill(u8,u8);
    void AddToBaseWeapon(u8,u8);
    void AddToBaseShield(u8);
    void ModdedSkillAdd(u8,s8);
    void ModdedWeaponAdd(u8,s8);
    void ModdedShieldAdd(s8);
    s8 capSkillBaseMax(u8);
    s8 capWeaponBaseMax(u8);
    s8 capSheildBaseMax();
    s8 getModdedSkill(u8);
    s8 getModdedWeapon(u8 param_2);
    s8 getModdedSheild();
    u8 isSkillCapped(u8 param_2);
    u8 isWeaponCapped(u8 param_2);
    u8 isShieldCapped();
};

char** skill_strings;
char** weapon_strings;