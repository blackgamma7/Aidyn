#include "widgets\WidgetMenu.h"


class WidgetScrollMenu : public BaseWidget{
public:
WidgetScrollMenu(u16 length);
Gfx * Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
u8 Tick();
u32 GetNumber();
u8 Append(BaseWidget* entry);
u8 Remove(BaseWidget* entry);
void SetFlags(u8 f);
};

//unused Scroll Menu child
class WidgetScrollMenuGray: public WidgetScrollMenu{
    public:
    Color32 unk80;
    WidgetScrollMenuGray(u16 length,Color32* colP);
    u8 Tick();
    u8 Append(BaseWidget *w,u8 val);
    ~WidgetScrollMenuGray();
    void SetHighlight();
    void SetChoice(u16); //overload of SetHighlight()?

};

BaseWidget* WSMG_ScrollUp(BaseWidget*,BaseWidget*);
BaseWidget* WSMG_ScrollDown(BaseWidget*,BaseWidget*);
WidgetScrollMenuGray* WSMG_Init(BaseWidget *bw,u16 len,s16 x,s16 y,u16 bx0,u16 by0,u16 bx1,u16 by1,u8 r,u8 g,u8 b,u8 a,u32 setCols,Color32 *col);

class WidgetFastScrollMenu : public BaseWidget{
    public:
    WidgetFastScrollMenu(u16 length);
    ~WidgetFastScrollMenu();
    Gfx * Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
    u8 Tick();
    void AdjustItemsX();
    void Update();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    BaseWidget* AFunc();
    u16 GetHeight();
    void SetSubstructColors(u8 r,u8 g,u8 b,u8 a,u8 r1,u8 g1,u8 b1,u8 a1,u8 param_10);
    u8 Append(BaseWidget* entry);
    u32 GetNumber();
};

//scroll menu substruct used by WidgetScrollMenu and WidgetFastScrollMenu
struct WSMSub {
    u8 scrollSpeed; //only used by WidgetCombatScrollMenu
    u8 blendSign; //+/- 1
    u8 reds[2];
    u8 blues[2];
    u8 greens[2];
    u8 alphas[2];
    u8 blendA;
    u8 blendB;
    Color32 col; //color used for highlighted item.
    u16 XOff;
    u16 yOff;
    u16 unk14; //unused?
    u16 unk16; //always 0
    BaseWidget** items;
    u16 maxCount;
    u16 highlight;
    u16 numChoices;
    u8 vSpace;
    u8 flag;
};

BaseWidget* WSM_UpFunc(BaseWidget*,BaseWidget*);
BaseWidget* WSM_DownFunc(BaseWidget*,BaseWidget*);
BaseWidget* WSM_AFunc(BaseWidget*,BaseWidget*);
BaseWidget* WSM_LeftFunc(BaseWidget*,BaseWidget*);
BaseWidget* WSM_RightFunc(BaseWidget*,BaseWidget*);