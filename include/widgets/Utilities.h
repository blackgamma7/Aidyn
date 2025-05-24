#include "widgets/WidgetText.h"
#include "widgets/WidgetClipText.h"
#include "widgets/WidgetBorg8.h"
#include "widgets/WidgetScrollMenu.h"
#include "widgets/WidgetArrayMenu.h"
#include "widgets/ShadowText.h"
#include "widgets/debugBG.h"


namespace Utilities{
    char * GetWidgetText(BaseWidget*);
    void ChangeWidgetText(BaseWidget *,char *,u8);
    void SetWidgetBoundsX(BaseWidget *,u16,u16);
    void SetWidgetBoundsX0(BaseWidget *,u16);
    void SetWidgetBoundsX1(BaseWidget *,u16);
    BaseWidget * GetHighlightedEntry(BaseWidget *);
    u16 GetHighlightIndex(BaseWidget*);
    void SetScrollMenuColors(BaseWidget *,u8,u8,u8,u8,u8,u8,u8,u8,u8);
    void ClearScrollMenu(BaseWidget *);
    void ClearScrollMenu2(BaseWidget *);
    void SetBorg8Dims(BaseWidget *,Borg8Header *,u8);
    void SetWidgetBounds(BaseWidget *,u16,u16,u16,u16);
    void SetWidgetBoundsX02(BaseWidget *,u16);
    void SetWidgetBoundsX12(BaseWidget *,u16);
    void SetWidgetBoundsY02(BaseWidget *,u16);
    void SetWidgetBoundsY12(BaseWidget *,u16);
    void SetWidgetColor(BaseWidget *,u8,u8,u8,u8);
    void SetRed(BaseWidget *,u8);
    void SetGreen(BaseWidget *,u8);
    void SetBlue(BaseWidget *,u8);
    void SetAlpha(BaseWidget *,u8);
    void MoveWidget(BaseWidget *,s16,s16);
    void MoveWidget2(BaseWidget *,s16,s16);

//TODO: replace return with proper class.

    WidgetDebugBG* DebugBackground(BaseWidget *,s16,s16,u16,u16,u8,u8,u8,u8);
    WidgetText* AddTextWidget(BaseWidget*,char*,s16 ,s16 ,byte ,byte ,byte ,byte);
    WidgetText* AddTextWidget2(BaseWidget*,char*,u16,u16,u16,u16);
    WidgetText* AddTextWidget3(BaseWidget*,char*,u16,u16,u16,u16,u8,u8,u8,u8);
    WidgetClipText* AddClipTextWidget(BaseWidget*,char*,u16,u16,u16,u16,u16);
    WidgetArrayMenu* AddWidgetArrayMenu(BaseWidget*,u16,u16,s16,s16,u16,u16,u16,u16 ,u8,u8,u8,u8);
    WidgetBorg8* AddBorg8Widget(BaseWidget*,Borg8Header *,s16,s16);
    WidgetBorg8* AddBorg8Widget2(BaseWidget*,Borg8Header *,short,short,short,short);
    WidgetScrollMenu* AddScrollMenu(BaseWidget*,u16,s16,s16,u16,u16,u16,u16,u8,u8,u8,u8,s32);
};

//TODO: add below to namespace once better understood.

void Ofunc_800bbf28(BaseWidget *,float,float);
void FUN_800bbfc8(BaseWidget *,u16);
void Ofunc_800bc064(BaseWidget *,u8 );
void Ofunc_800bc300(BaseWidget *,u16);
