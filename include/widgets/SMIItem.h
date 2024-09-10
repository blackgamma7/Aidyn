#include "widgets/WidgetBorg8.h"
#include "widgets/WidgetClipText.h"

//Widget for Inventory item entry
class SMIItem : public BaseWidget{

    EquipInstance *item;
    u8 quantity;
    u8 userIndex;
    WidgetBorg8 *userPortait;
    WidgetBorg8 *ItemIcon;
    WidgetClipText *QuantityTtx;
    WidgetClipText *ItemName;
    s16 nameX; //stores x offset of ItemName
    u16 unkx; //another offset, unused.
};