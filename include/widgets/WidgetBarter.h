#include "widgets/Utilities.h"
#include "widgets/WidgetTrainShop.h"

class WidgetBarter: public WidgetMenu{
    public:
    u8 partyPicker;
    WidgetInvShop *itemWidget;
    WidgetInvShop *unk84;
    WidgetInvShop *description;
    u8 invType;
    undefined field9_0x8d;
    undefined field10_0x8e;
    undefined field11_0x8f;
    BaseWidget *background;
    WidgetClipText *goldText;
    u32 unk98;
    WidgetBarter(WidgetTrainShop*,ItemID);
    ~WidgetBarter();
    void UpdateGoldText();
    Gfx* Render(Gfx*, u16, u16, u16, u16);
    u8 Tick();
    void m80044a94();
    u32 GetNumber();
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
    public:
    WidgetInvShop* currShop;
    BaseWidget* bg;
    WidgetScrollMenu *scroll;
    int salePrice;
    u8 quant;
    DollBarterConfirm(WidgetInvShop *shop,u32 sellPrice);
    ~DollBarterConfirm();
    Gfx* Render(Gfx*, u16, u16, u16, u16);
    u8 Tick();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    BaseWidget* AFunc();
    u32 GetNumber();
};

float gBarterFloat=0;