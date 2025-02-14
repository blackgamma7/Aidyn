#include "widgets/WidgetBorg8.h"
#include "widgets/WidgetClipText.h"
#include "itemInstances.h"


//Widget for Inventory item entry
class SMIItem : public BaseWidget{
    public:
    EquipInstance *item;
    u8 quantity;
    u8 userIndex;
    WidgetBorg8 *userPortait;
    WidgetBorg8 *ItemIcon;
    WidgetClipText *QuantityTtx;
    WidgetClipText *ItemName;
    s16 nameX; //stores x offset of ItemName
    u16 unkx; //another offset, unused.
    SMIItem(EquipInstance *,u8,u8);
    ~SMIItem();
    Gfx* Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
    u8 Tick();
    u16 GetWidth();
    u16 GetHeight();
    BaseWidget* AFunc();
    BaseWidget* BFunc();
    BaseWidget* ZFunc();
    u32 GetNumber();
};