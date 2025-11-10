#include "widgets/Utilities.h"
#include "widgets/WidgetTrainShop.h"

class WidgetBarter: public WidgetMenu{
    public:
    u8 partyPicker;
    WidgetInvShop *field5_0x80;
    WidgetTrainShop *field6_0x84;
    WidgetTrainShop *description;
    u8 invType;
    undefined field9_0x8d;
    undefined field10_0x8e;
    undefined field11_0x8f;
    BaseWidget *background;
    WidgetClipText *goldText;
    u32 unk98;
    WidgetBarter(WidgetTrainShop,ItemID);
    ~WidgetBarter();
    void UpdateGoldText();
    Gfx* Render(Gfx*, u16, u16, u16, u16);
    u8 Tick();
    void m80044a94();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    BaseWidget* LeftFunc();
    BaseWidget* RightFunc();
    BaseWidget* BFunc();
    BaseWidget* AFunc();
    BaseWidget* CUpFunc();
    BaseWidget* CDownFunc();
};

BaseWidget* WidgetBarter_ACallback(BaseWidget*,BaseWidget*);


class DollBarterConfirm: public WidgetMenu {
    void* field1_0x7c;
    WidgetTrainShop *field5_0x80;
    BaseWidget *field6_0x84;
    int field7_0x88;
    u8 field8_0x8c;
    DollBarterConfirm(WidgetTrainShop *,u32);
    ~DollBarterConfirm();
};
