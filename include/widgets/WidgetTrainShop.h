#include "widgets\WidgetMenu.h"
#include "widgets\WidgetChild0.h"
#include "widgets\WidgetClipText.h"
#include "widgets\WidgetScrollMenu.h"
#include "itemInstances.h"


class WidgetTrainShop : public WidgetMenu{
    public:
    BaseWidget *TitleWidget;
    WidgetFastScrollMenu *scrollMenu;
    WidgetChild0* unk84;
    u8 partyPicker;
    WidgetTrainShop();
    ~WidgetTrainShop();
    BaseWidget* SetHighlight(u16);
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    u8 Tick();
    void SetArrows();
    virtual void InitMenu();
    virtual u32 unk(); //just returns 0?
    virtual void Confirm(u16,u16);
    virtual void Purchase(u16);
    virtual u32 GetGoldPrice(u16);
    virtual u32 GetExpPrice(u16);
};
//Widget for Inventory item entry
class SMIItem:public BaseWidget{
    ItemInstance* item;
    u8 quantity;
    u8 userIndex;
    u16 unk82; //align?
    WidgetBorg8* userPortrait;
    WidgetBorg8* ItemIcon;
    WidgetClipText* QuantityText;
    WidgetClipText* ItemName;
    u16 nameX; //some x offset for ItemName
    u16 unkX; //set during Tick(), but not read?
    SMIItem(ItemInstance *,u8,u8);
    ~SMIItem();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    u8 Tick();
    u16 GetWidth();
    u16 GetHeight();
    BaseWidget* AFunc();
    BaseWidget* BFunc();
    BaseWidget* ZFunc();
    u32 GetNumber();
};

class WidgetInvShop: public WidgetTrainShop{
    public:
    ItemInstance* unk8c;
    IInventory* inventory;
    class DollEquipmentMenu* dollMenu;
    u16 unk98;
    u16 unk9a;
    WidgetInvShop(IInventory*,class DollEquipmentMenu*);
    ~WidgetInvShop();
    void InitMenu();
    u32 unk();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    u8 Tick();
    void Confirm(u16,u16);
    void Purchase(u16);
    u32 GetExpPrice(u16);
    u32 GetGoldPrice(u16);
    u8 SetHighlight(ItemID,u8,u8);
    bool m8003d194(u8);
    bool NewItem(u8,u8,u8);
    bool AddItem(u16,u8,u8,char*,u16);
    void SortA();
    void SortB();
    bool m8003d674(u16,u8);
    u32 GetNumber();
};

class WidgetSkillTrain:public WidgetTrainShop{
    public:
    u32 isTraining;
    WidgetSkillTrain(u8);
    void InitMenu();
    ~WidgetSkillTrain();
    u32 unk();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    u8 Tick();
    BaseWidget* AFunc();
    BaseWidget* CDownFunc();
    u32 GetGoldPrice(u16);
    u32 GetExpPrice(u16);
    void Purchase(u16);
    void Confirm(u16,u16);
    u32 GetNumber();
};
BaseWidget* WST_AButtonFunc(BaseWidget*,BaseWidget*);

class WidgetSpellTrain: public WidgetTrainShop{
    public:
    u32 isTraining;
    WidgetSpellTrain(u8);
    ~WidgetSpellTrain();
    void InitMenu();
    u32 unk();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    u8 Tick();
    BaseWidget* AFunc();
    BaseWidget* CDownFunc();
    u32 GetGoldPrice(u16);
    u32 GetExpPrice(u16);
    void Purchase(u16);
    void Confirm(u16,u16);
    u32 GetNumber();
};

class WidgetStatTrain: public WidgetTrainShop{
    public:
    WidgetClipText* expToSpendT;
    WidgetClipText* expSpending;
    WidgetClipText* expremaining;
    WidgetClipText* expTotal;
    WidgetClipText* expPrice;
    WidgetClipText* expTNL;
    WidgetStatTrain();
    ~WidgetStatTrain();
    void InitMenu();
    u32 unk();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    u8 Tick();
    u32 GetNumber();
    void Confirm(u16,u16);
    void Purchase(u16);
    u32 GetExpPrice(u16);
    u32 GetGoldPrice(u16);
    BaseWidget* AFunc();
    BaseWidget* CDownFunc();
};

u8 gPartyPicker=0;