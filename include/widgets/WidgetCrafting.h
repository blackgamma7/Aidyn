#include "widgets/WidgetMenu.h"

//Base class for crafting menus
class WidgetCrafting : public WidgetMenu{
    u32 partyIndex;
    BaseWidget *scrollMenu;
    private:
    BaseWidget* TextPopup(char* txt);
};