#include "widgets/Utilities.h"
#include "entity.h"

//Base class for crafting menus
class WidgetCrafting : public WidgetMenu{
    public:
    u32 partyIndex;
    WidgetScrollMenu *scrollMenu;
    WidgetCrafting(u32 partyind);
    ~WidgetCrafting();
    u8 Tick();
    Gfx* Render(Gfx*g,u16 x0,u16 y0,u16 x1,u16 y1);
    BaseWidget *BFunc();
    BaseWidget *UpFunc();
    BaseWidget *DownFunc();
    BaseWidget* TextPopup(char* txt);
};

//class for potion crafting menu
class WidgetPotionCraft: public WidgetCrafting{
    public:
    WidgetPotionCraft(u32 partyind);
    ~WidgetPotionCraft();
    BaseWidget *AFunc();
    BaseWidget *CDownFunc();
    char* FailString(u8);
    char* CraftedString(u8);
    char* NotEnoughString(u8);

};

class WidgetMenuHealer: public WidgetCrafting{
    public:
    BaseWidget* textBox;
    WidgetMenuHealer(u32 partyind);
    BaseWidget *AFunc();
    BaseWidget *BFunc();
    void LayOnHands();
    void HealWithHerbs();
    void Restore();
    void ShowHealedMember(CharSheet* chara,u16 var,buttonFunc func);
    void HealingFunc2(u8,u8);
    void ClearText();
    void PrintHealing(u8);
    void PrintHerbHealing(u8);
    void PrintRestore(u8);
    void PrintStat(u8,u8);
    ~WidgetMenuHealer();
};