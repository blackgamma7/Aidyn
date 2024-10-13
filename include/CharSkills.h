#include "GhidraDump.h"

typedef enum WeaponClassEnum {
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
} WeaponClassEnum;

typedef enum SkillEnum {
 	SKILL_ALCHEMIST, SKILL_DIPLOMAT, SKILL_HEALER, SKILL_LOREMASTER,
    SKILL_MECHANIC, SKILL_MERCHANT, SKILL_RANGER, SKILL_STEALTH,
    SKILL_THEIF, SKILL_TROUBADOR, SKILL_WARRIOR, SKILL_WIZARD, 
    SKILL_Total,SKILL_NONE=255
} SkillEnum;

#define SKILLCOUNT SKILL_Total
#define WEAPONCOUNT WEAPON_Total

struct CharSkills { /* Skill and weapon levels. Also sheild. */
    s8 SkillBase[SKILLCOUNT];
    s8 WeapomBase[WEAPONCOUNT];
    s8 ShieldBase;
    s8 SkillModded[SKILLCOUNT];
    s8 WeaponModded[WEAPONCOUNT];
    s8 ShieldModded;
};