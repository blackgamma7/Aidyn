#include "widgets/WidgetMenu.h"
#include "widgets/WidgetClipText.h"
#include "itemInstances.h"
#include "CharSkills.h"

//displays item details. has  many different constructors for each type.
class WidgetItemDetail :public WidgetMenu{
    public:
    u16 bottom;
    WidgetClipText* AddLeftText(char* txt);
    WidgetClipText* AddRightText(char* txt);
    WidgetItemDetail(ItemInstance* item);
    WidgetItemDetail(SpellInstance* spel);
    WidgetItemDetail(u16 stat);
    WidgetItemDetail(CharSkills* sk,u16 type);
    WidgetItemDetail(WeaponInstance* wep);
    WidgetItemDetail(ArmorInstance* arm);
    WidgetItemDetail(GearInstance* gear);

    void SidePopup();
    void PrintNameIcon(char* txt);
    void PrintWeaponType(char* txt);
    void PrintAspect(u8 asp);
    void PrintStrReq(u8 str);
    void PrintBaseHit(u8 hit);
    void PrintDamage(u8 dmg);
    void PrintStatMod(StatMod* mod);
    void PrintSkillInfo(StatMod* mod);
    void PrintMagicInfo(u8* spell);
    void PrintEnchantment(SpellCharges* ench);
    void PrintResistance(resist_float* resist);
    void PrintResistance(resist_float* resist);

    Gfx* Render(Gfx*g,u16 x0,u16 y0,u16 x1,u16 y1);
    u8 Tick();
    BaseWidget* Control(controller_aidyn* cont);
    ~WidgetItemDetail();
    u32 GetNumber();

};
#define PrintPlus(x,buff)\
  if(x>0) sprintf(buff,"(+%d)",x);\
  else sprintf(buff,"(%d)",x)

#define PrintPlus2(x,buff)\
  if(x) sprintf(buff,"(+%d)",x);\
  else sprintf(buff,"(%d)",x)


//maybe method?
void WidgetMenuPopup(BaseWidget* w);