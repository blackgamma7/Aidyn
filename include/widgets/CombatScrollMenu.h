#include "widgets/WidgetChoiceDia.h"
#include "widgets/widgetGroup.h"
#include "entity.h"

//lists spells, heal methods and troubadour party member can do.
class WidgetCombatSkills: public WidgetChoiceDia{
  public:
  WidgetScrollArrows* arrows;
    WidgetCombatSkills(u8 *spells,bool troub,bool hands,int herbs);
  ~WidgetCombatSkills();
  BaseWidget* AFunc();
  BaseWidget* BFunc();
};
struct CombatMenuSpell{
    SpellInstance* spellP;
    u32 index;
};
WidgetCombatSkills* InitCombatSkillsMenu(u8 *spells,bool troub,bool hands,bool herbs);
WidgetGroup * char_func_icon(char *str,BaseWidget::buttonFunc AFunc,u16 param_3,u8 param_4,Color32 *col,u32 borg8,u16 height);
u16 MaxWidgetWidth(BaseWidget *w,u16 wMax);
int find_char_in_party(CharSheet *param_1);
void init_combatSkillValues();
BaseWidget * FUN_800920d8(BaseWidget *w0,BaseWidget *w1);
BaseWidget * Troubador_perform(BaseWidget *w0,BaseWidget *w1);
BaseWidget * combat_layOnHands(BaseWidget *w0,BaseWidget *w1);
BaseWidget * combat_healWithHerbs(BaseWidget *w0,BaseWidget *w1);
int CombatSortItemsByName(CombatMenuSpell *param_1,CombatMenuSpell *param_2);
int FUN_80092270(u8 *param_1,CombatMenuSpell *param_2,CharSheet *param_3);


//used to show Item with enchantements and potions usable in battle
class WidgetCombatItems: public WidgetChoiceDia{
  public:
  WidgetScrollArrows* arrows;
  WidgetCombatItems(s32 showWeapon,s32 showShield,s32 ShowArmor,u8 *gear,s32 *potions);
  ~WidgetCombatItems();
  BaseWidget* AFunc();
  BaseWidget* BFunc();
  u16 AddItem(ItemInstance *param_2,buttonFunc UseFunc,u16 param_4,u8 param_5,u16 param_6,u16 param_7);
};

WidgetCombatItems* LoadCombatItems(s32 showWeapon,s32 showShield,s32 ShowArmor,u8 *gear,s32 *potions);
void init_combatItemValues();
BaseWidget * FUN_80092894(BaseWidget *w0,BaseWidget *w1);
BaseWidget * FUN_800928f8(BaseWidget *w0,BaseWidget *w1);

class WidgetCombatScrollMenu:public WidgetScrollMenu{
  public:
  WidgetCombatScrollMenu(u8 choices);
    u8 Tick();
    Gfx * Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
    ~WidgetCombatScrollMenu();
};

BaseWidget * WCSM_UpFunc(BaseWidget *w0,BaseWidget *w1);
BaseWidget * WCSM_DownFunc(BaseWidget *w0,BaseWidget *w1);
void FUN_8002ef0c(u8 param_1,u8 param_2,char *param_3,float param_4);