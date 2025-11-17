#include "typedefs.h"


typedef enum PotionEnum{
	POTION_FIRE, //Fire Flask. 4d6 damage
    POTION_INFERNO, //Inferno Flask. 8d6 damage
    POTION_SLEEP, //Sleep Gas. 15 damage, effects Stamina
    POTION_ACID, //Acid Flask.
    POTION_HEALING, //Healing potion. restore 15-25% max HP.
    POTION_STAMINA, // remove "exhaustion" effect
    POTION_CURING, //Curing potion. restore 40-60% max HP.
    POTION_ANTIDOTE, //Same as "Remove Poison" spell - remove "Poison" effect, if you have a True Name
    POTION_RESTORE, //remove debuff spells
    POTION_STRENGTH, //+10 Strength for 3 in-game hours.
    POTION_DEXTERITY, //+10 Dexterity for 3 in-game hours.
    POTION_ASPECT, //listed as "A". ommited from game. changed in healing potions in some functions.
    POTION_JUMPING, //listed as "J". ommited from game.
    POTION_CLARITY,//+3 Loremaster for 3 in-game hours.
    POTION_CHARISMA,//+3 Diplomat for 3 in-game hours.
    POTION_DEFENCE,//+15 Defence for 3 in-game hours.
    POTION_STEALTH, //+3 Stealth for 3 in-game hours.
    MAXPOTIONS
}PotionEnum;

class PotionEffect {
    public:
    u8 ID;
    u8 power;
    u32 timer;
    u32 SpellVisualIndex;
    void Init(u8 ID_,u8 pow,u32 t);
    void RemoveSpellVisual();
    bool DecTimer(u16 mag,int delta);
};

char** potion_names=NULL; //names of Potions are Romcopied in.

void load_potion_romstring(void);
void clear_potion_romstrings(void);
void SetStatMod2(StatMod *,u8,s8);