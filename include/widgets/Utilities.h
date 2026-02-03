#include "widgets/WidgetText.h"
#include "widgets/WidgetClipText.h"
#include "widgets/WidgetBorg8.h"
#include "widgets/WidgetScrollMenu.h"
#include "widgets/WidgetScrollList.h"
#include "widgets/WidgetArrayMenu.h"
#include "widgets/ShadowText.h"
#include "widgets/debugBG.h"


namespace Utilities{
    char * GetWidgetText(BaseWidget*);
    void ChangeWidgetText(BaseWidget *,char *,u8);
    void SetTextWidgetBoundsX(BaseWidget *,u16,u16);
    void SetTextWidgetBoundsX0(BaseWidget *,u16);
    void SetTextWidgetBoundsX1(BaseWidget *,u16);
    void SetTextWidgetScale(BaseWidget *w,float x,float y);
    void SetArrayVSpace(BaseWidget *,u16);
    void SetScrollSpeed(BaseWidget *,u8 );
    BaseWidget * GetHighlightedEntry(BaseWidget *);
    u16 GetHighlightIndex(BaseWidget*);
    void SetScrollMenuColors(BaseWidget *,u8,u8,u8,u8,u8,u8,u8,u8,u8);
    void RemoveScrollMenuEntry(BaseWidget *,u16);
    void ClearScrollMenu(BaseWidget *);
    void ClearScrollMenu2(BaseWidget *);
    void SetBorg8Dims(BaseWidget *,Borg8Header *,u8);
    void SetWidgetBounds(BaseWidget *,u16,u16,u16,u16);
    void SetTextWidgetBoundsX02(BaseWidget *,u16);
    void SetTextWidgetBoundsX12(BaseWidget *,u16);
    void SetWidgetBoundsY02(BaseWidget *,u16);
    void SetWidgetBoundsY12(BaseWidget *,u16);
    void SetWidgetColor(BaseWidget *,u8,u8,u8,u8);
    void SetRed(BaseWidget *,u8);
    void SetGreen(BaseWidget *,u8);
    void SetBlue(BaseWidget *,u8);
    void SetAlpha(BaseWidget *,u8);
    void MoveWidget(BaseWidget *,s16,s16);
    void MoveWidget2(BaseWidget *,s16,s16);
    WidgetDebugBG* DebugBackground(BaseWidget *,s16,s16,u16,u16,u8,u8,u8,u8);
    WidgetText* AddTextWidget(BaseWidget*,char*,s16 ,s16 ,u8 ,u8 ,u8 ,u8);
    WidgetText* AddTextWidget2(BaseWidget*,char*,u16,u16,u16,u16);
    WidgetText* AddTextWidget3(BaseWidget*,char*,u16,u16,u16,u16,u8,u8,u8,u8);
    WidgetClipText* AddClipTextWidget(BaseWidget*,char*,u16,u16,u16,u16,u16);
    WidgetArrayMenu* AddWidgetArrayMenu(BaseWidget *w,u16 len,u8 param_3,s16 x,s16 y,u16 x0,u16 x1,u16 y0,u16 y1,u8 r,u8 g,u8 b,u8 a);
    WidgetBorg8* AddBorg8Widget(BaseWidget*,Borg8Header *,s16,s16);
    WidgetBorg8* AddBorg8Widget2(BaseWidget *w,Borg8Header *b8,s16 x0,s16 y0,s16 x1,s16 y1);
    WidgetScrollMenu* AddScrollMenu(BaseWidget*,u16,s16,s16,u16,u16,u16,u16,u8,u8,u8,u8,s32);
};

//helper funcs in seperate script.

BaseWidget * ofunc_icon_or_portrait(BaseWidget *parent,ItemID ID,u16 H,u16 W,u8 type);
BaseWidget * WidgetBorg8At(BaseWidget *parent,u16 Index,s16 X,s16 Y,s16 H,s16 W);
BaseWidget * FUN_8004ce14(BaseWidget *parent,u16 x0,u16 y0,u16 x1,u16 y1,u8 r,u8 g,u8 b,u8 a);
void Ofunc_8004cec0(BaseWidget *w,Color32 *param_2,Color32 *param_3,u8 param_4);
void free_borg8_widget(BaseWidget * w);