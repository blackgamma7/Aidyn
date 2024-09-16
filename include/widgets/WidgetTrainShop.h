#include "widgets\WidgetMenu.h"
#include "widgets\WidgetChild0.h"


class WidgetTrainShop : public WidgetMenu{
    BaseWidget *TitleWidget;
    BaseWidget *scrollMenu;
    WidgetChild0* unk84;
    u8 partyPicker;
    void InitMenu();
    u32 unk(); //just returns 0
    void Confirm(u16,u16);
    void Purchase(u16);
    u32 GetGoldPrice(u16);
    u32 GetExpPrice(u16);
};