#include "GhidraDump.h"
#include "entity.h"
#include "mathN64.h"

//used by combatants
struct CombatEntity {
    vec2f coord;
    vec2f coord2;
    s32 TargetIndex;
    s8 unk14;
    vec2f facing;
    u8 index;
    u8 moveRange;
    u8 unk22;
    u8 unk23;
    u8 AtkTypeOther;
    u8 AtkType;
    u8 itemIndex;
    u8 item;
    u8 mirrorVal; //enhanced by "mirror" spell.
    u8 damage;
    u8 Healing;
    u16 flags;
    resist_float resists[2];
    CharSheet *charSheetP;
    CombatAI_s *aiP;
    u8 unk48[60]; //unused?
    u32 notboss;
    u8 wepLocator;
    u8 shieldLocator;
    u8 throwingFlag;
};


#define COMBATENT_CASTING 1<<0  /* casting Magic */
#define COMBATENT_CANMOVE 1<<1  /* petrify? */
#define COMBATENT_BARD    1<<2  /* troubador */
#define COMBATENT_FLAG3   1<<3  //something wi AI
#define COMBATENT_ALLY    1<<4  /* friend If Set */
#define COMBATENT_ENEMY   1<<5  /* npc if set */
#define COMBATENT_FLED    1<<6  /* escaped */
#define COMBATENT_FLAG7   1<<7  /* something w/ movement */
#define COMBATENT_MEDIC   1<<8  /* lay on hands */
#define COMBATENT_HERBS   1<<9  /* heal with herbs */
#define COMBATENT_BENCH   1<<10 /* benched */
