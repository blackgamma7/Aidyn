#include "GhidraDump.h"
#include "entity.h"
#include "mathN64.h"

u8 NotAspectBonus(u8);

//used by combatants
class CombatEntity {
    public:
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
    void Init(CharSheet *,int,u8,u8,s8,u8,int,u8);
    void FreeAi();
    void GetCoordU8(u8 *,u8 *);
    void GetCoord(float *,float *);
    void GetCoord2(float *,float *);
    u8 GetCoordXU8();
    u8 GetCoordYU8();
    u8 GetCoord2XU8();
    u8 GetCoord2YU8();
    float GetCoordX();
    float GetCoordY();
    float GetCoord2X();
    float GetCoord2Y();
    void SetCoords(float,float);
    void SetCoords2(float,float);
    u8 Flag0();
    u8 Flag1();
    u8 Flag2();
    u8 Flag3();
    u8 Flag4();
    u8 Flag5();
    u8 Flag6();
    u8 Flag7();
    u8 Flag89();
    void SetFlag(u16);
    void UnsetFlag(u16);
    void ToggleFlag(u16);
    u8 UnusedMovement();
    void NOOP_80068350();
    u8 m80068358();
    void SetMovementRange();
    u8 DEXCheck();
    u8 GetProtection();
    s8 GetBlock();
    u32 GetSheildProtection(u8);
    void Coord2IsCoord();
    void m80068924();
    void SetCardinalFacing(s8);
    u8 m80068b0c(u8,u8);
    u8 CheckFacings(float,float);
    u8 CheckBackstab(CombatEntity *);
    void m80068dd8();
    void m80068e38();
    void FaceTarget(CombatEntity*);
    void TeleportMovePlayer();
    void SetPlayerRotate();
    u8 GetWeaponAnimation(u8);
    u32 m80069114();
    u8 m800692bc(CombatEntity *);
    u8 m80069384(CombatEntity *,s8,s8,s32);
    float Get2DProximity(CombatEntity *);
    float m80069554(CombatEntity*);
    u8 CanUsePotion(u8);
    u8 CanUseFlask(CombatEntity *);
    u8 m8006963c(CombatEntity *);
    u8 CanBeTargeted(CombatEntity *,s32);
    u32 GetSpellTargetCount();
    u8 canControl(SpellInstance *);
    u8 SpellEffectsTarget(CombatEntity *,SpellInstance *);
    u8 AIShouldNotCastSpell(CombatEntity *,SpellInstance *);
    u8 m80069d00(CombatEntity *,float,float);
    u8 AIShouldCastMagic(CombatEntity *);
    u8 SpellEffectsPartyInArea();
    uint m8006a1dc();
    void m8006a274();
    void Ofunc_8006a2f0(u8);
    void m8006a394(u8,u8);
    void Ofunc_8006a450(s8);
    void EndTurn();
    void Escaped();
    u8 getNotAspectBonus();
    u8 IsAspectBonus();
    u8 m8006a830(CombatEntity *,u8,u8);
    u8 isMagicElement(u8);
    u8 DoesElementResist(u8,u8);
    u8 CalcGearResist(u8,float *);
    u8 CanResistSpell(SpellInstance *,u8);
    u8 MagicResistChecks(SpellInstance *,float *);
    u16 CheckVSMagic(SpellInstance *);
    u32 GetSTRSteps();
    void Death();
    u8 HasPetrifyEffect();
    s16 AttackCalc1(CombatEntity *,s8,s8,u8);
    s16 SkillCheckFloat(s16 ,s16,u8);
    void WeaponSkillUpChance(u8,u8);
    s16 CalcAttackResist(CombatEntity*,s16,u8);
    s16 UseWeaponEnchantment(CombatEntity *);
    s16 CalculateWeaponAttack(CombatEntity *);
    s16 STRTheifCheck(s16,s32,CombatEntity *,u8,s32);
    s32 TroubadorMod(s16);
    s32 AspectMulti(s16);
    s16 NightCheck(s16,s16,s16,s16,u16);
    s16 Unk8006bfc0(s16,u8,u8,s16,s16);
    s16 TheifBackstabMod(s16,u8,s16,s16);
    s16 CalculateAttackAccuracy(CombatEntity*,s8,s8,u8);
    u16 WeaponAttack(CombatEntity *);
    u8 GetSpellError(CombatEntity *,SpellInstance *,u8);
    void PrintSpellFailCause(char *);
    void PrintSpellCast(CombatEntity *,SpellInstance *);
    void PrintSpellFail();
    void PrintSpellResist(CombatEntity *,SpellInstance *);
    void PrintSpellError(CombatEntity* ,s32 ,u8);
    u8 IsControlMagic(u8);
    u8 isPetrify(u8);
    u8 m8006cbb4(CombatEntity *,SpellInstance *);
    u8 ControlPetrifyCheck(CombatEntity *,SpellInstance*,u8);
    u8 CheckForPetrify(CombatEntity *,SpellInstance *,u8);
    u8 CheckSpellIngredient(SpellInstance *);
    u16 AspectMulti_check(u8);
    u8 SpellIngredientCheck(SpellInstance*,s16,s16);
    u8 CheckSpellWizard(CombatEntity*,SpellInstance *,u8);
    u8 UseSpellCharge(CombatEntity*,SpellInstance *,u8);
    u8 MagicCheck(SpellInstance *,CombatEntity *);
    u8 VSMagic(SpellInstance *,CombatEntity *,char *);
    u8 Banish(CombatEntity *,SpellInstance *);
    s32 DispelMagic(CombatEntity *,SpellInstance *,u8,u8);
    s32 EnchantAlly(CombatEntity *,SpellInstance *,u8,u8,u8);
    s16 CalcSpellDamage(SpellInstance *,CombatEntity *,u8,u8);
    s16 MagicDamageResistCalc(CombatEntity *,SpellInstance *,u8);
    s16 CalcMagicResist(s16,SpellInstance *);
    void SubtractPotion();
    void HealByPotion(CombatEntity *,u16,u16);
    u8 UsePotion(CombatEntity *);
    s16 PotionAccuracy(CombatEntity *,u8);
    void PrintFlaskMiss(CombatEntity *,u8);
    void FlaskNoop(s8,s8,bool,s16,u8);
    u16 GetFlaskDamage();
    void FlaskAttack(CombatEntity *,s16);
    u8 PotionAttack(CombatEntity *);
    u8 HealingSkill(CombatEntity *,playerData*);
    u8 SelectAttack(CombatEntity *,playerData *);
    s16 m8006edd0(CombatEntity *,playerData *,playerData *);
    s16 GoblinAmbushAttack(CombatEntity *,s16);
    void TryCheatDeath(s16);
    u8 CalculateAttack(CombatEntity *,u8);
    void TroubadourEnd();
    void UpdateMoveFlag();
    void TroubadourUpChance(u8);
    void m8006f448();
    void Troubadour();
    void m8006f7f8(u16);
    void m8006f8a0();
    void m8006f8bc();
    void m8006f8d8(ItemID,u8);    
    void ShowWeaponFlask();
    u32 GetShieldModel();
    u16 GetWeaponModel();
    u8 BowEquipped();
    void AttachWeaponShieldModel(u16,s32,s32);
    void ThrowingEquipped();
    void ShowWeaponSheild();
    SceneData* GetWeaponScene();
    void GetWeaponRanges(float *,float *,float *);
    void ClearSpellEffects();
    void m80070234();
    void CheckTargetIndex();
    void PrintDamage(s16);
    void PrintHealing(s16);

    void SetAktRangeMulti(u8);
    void PrintEvade(CombatEntity *);
    void PrintSwingAndMiss(CombatEntity *);
};

struct combat_aiscore {
    u8 spell_pri;
    u8 x;
    u8 y;
    u8 unk0x3;
    CombatEntity *combatEnt;
};

struct CombatAI_s {
    WeaponInstance *weapon;
    char unk1;
    char entIndex;
    u8 morale; /* morale? */
    char unk7;
    u8 command;
    u8 flags;
    u8 spells[8];
    u8 unk12;
    u8 unk13; /* length of array at gCombatP-> 0x5320 */
    CombatEntity *combatEnt;
    int unk18;
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

//stop playing Troubador if applicable
#define TroubadourStop if(this->Flag2())this->TroubadourEnd()

void noop_80070658(CombatEntity * x);

u32 u32_800f5440; //used as 3rd arg for getSpellSafe(). not set, unused in said function.

//two functions refenced in a table near the bottom of .data

s16 retMinus1(void);
s16 passto_retMinus1(void);