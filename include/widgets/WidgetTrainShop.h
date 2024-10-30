#include "widgets\WidgetMenu.h"
#include "widgets\WidgetChild0.h"


class WidgetTrainShop : public WidgetMenu{
    BaseWidget *TitleWidget;
    BaseWidget *scrollMenu;
    WidgetChild0* unk84;
    u8 partyPicker;
    virtual void InitMenu();
    virtual u32 unk(); //just returns 0
    virtual void Confirm(u16,u16);
    virtual void Purchase(u16);
    virtual u32 GetGoldPrice(u16);
    virtual u32 GetExpPrice(u16);
};