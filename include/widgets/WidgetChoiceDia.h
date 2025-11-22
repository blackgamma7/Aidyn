#include "widgets/Utilities.h"


// Widget for Choice lists
class WidgetChoiceDia :public WidgetMenu{
    public:
    WidgetScrollMenu *scrollMenu;
    WidgetBorg8 *borg8WidgetA;
    WidgetBorg8 *borg8WidgetB;
    WidgetBorg8 *borg8WidgetC;
    WidgetBorg8 *borg8WidgetD;
    WidgetBorg8 *borg8WidgetE;
    WidgetBorg8 *borg8WidgetF;
    WidgetBorg8 *borg8WidgetG;
    WidgetBorg8 *borg8WidgetH;
    WidgetBorg8 *borg8WidgetI;
    WidgetText *TextWidget;
    u16 unka8;
    u16 unkaa;
    u32 unkac;
    WidgetChoiceDia(u16 choices,char *msg,s16 *dims,u16 *dims2,s16 *dims3,Color32 *colA,Color32 *colB,u32 param_9);
    WidgetChoiceDia(u16 choices,char *msg,u16 param_4,Color32 *colA,Color32 *colB,u32 param_7,u16 param_8,s16 param_9);
    WidgetChoiceDia(u16 choices,u16 param_3,Color32 *colA,u32 param_5,u16 param_6);
    WidgetChoiceDia(u8 choices,u16 W,u16 H,u32 param_5,u16 param_6);
    ~WidgetChoiceDia();
    Gfx* Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1);
    BaseWidget* AFunc();
    BaseWidget* BFunc();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    u8 AppendScrollMenu(BaseWidget*);
    void SetImages(s16*,u32);
    void MoveX(s16);
    void SetHighlight(u16);
    void Update();
    void m8004e0b0(Color32 *);
};

void FUN_8004cfd0(BaseWidget *w);