#include "Controller.h"
#include "font.h"

// Base Class for almost all UI Elements
class BaseWidget{
public:
    typedef BaseWidget* (*buttonFunc)(BaseWidget*,BaseWidget*);
    typedef u8 (*fadeFunc)(BaseWidget*);
    fadeFunc fadeIn; 
    fadeFunc fadeOut;
    buttonFunc UpButtonFunc;
    buttonFunc DownButtonFunc;
    buttonFunc LeftButtonFunc;
    buttonFunc RightButtonFunc;
    buttonFunc AButtonFunc;
    buttonFunc BButtonFunc;
    buttonFunc StartButtonFunc;
    buttonFunc LButtonFunc;
    buttonFunc RButtonFunc;
    buttonFunc ZButtonFunc;
    buttonFunc CUpButtonFunc;
    buttonFunc CDownButtonFunc;
    buttonFunc CLeftButtonFunc;
    buttonFunc CRightButtonFunc;
    void *substruct; /* changes for each widget type */
    BaseWidget *parent; //parent widget
    BaseWidget *siblingL; //left sibling(?)
    BaseWidget *siblingR; //right sibling(?)
    BaseWidget *child; //child widget
    BaseWidget *link4; //other child widget?
    Color32 col;
    u8 varU8; //changes for each widget type
    u16 varU16; //changes for each widget type.
    s16 posX; //screenspace x position
    s16 posY; //screenspace y position
    s16 boundX0;
    s16 boundX1;
    s16 boundY0;
    s16 boundY1;
    Borg8Header *borg8;
    u8 state;
    u16 height;
    u16 width;
    BaseWidget();
    virtual ~BaseWidget();
    virtual u16 GetWidth();
    virtual u16 GetHeight();
    virtual u32 GetNumber();
    virtual u8 Tick();
    virtual u8 Link(BaseWidget* other);
    virtual u8 Unlink(BaseWidget* other);
    virtual Gfx* Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1);
    virtual void SetColor(u8 r, u8 g, u8 b, u8 a);
    virtual BaseWidget* Control(controller_aidyn* input);
    virtual BaseWidget* UpFunc();
    virtual BaseWidget* DownFunc();
    virtual BaseWidget* LeftFunc();
    virtual BaseWidget* RightFunc();
    virtual BaseWidget* AFunc();
    virtual BaseWidget* BFunc();
    virtual BaseWidget* ZFunc();
    virtual BaseWidget* LFunc();
    virtual BaseWidget* RFunc();
    virtual BaseWidget* StartFunc();
    virtual BaseWidget* CUpFunc();
    virtual BaseWidget* CDownFunc();
    virtual BaseWidget* CLeftFunc();
    virtual BaseWidget* CRightFunc();
    void SetCoords(s16 x,s16 y);
    void SetWidth(u16 w);
    void SetHeight(u16 h);
    void SetBorg8(Borg8Header* b8,u8 fit);
    void SetSomeBounds(u16 Y0,u16 X0, u16 X1, u16 Y1);
    void GetSomeBounds(s32* Y0,s32* X0, s32* X1, s32* Y1);
    Gfx* RenderChildren(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1);
    void FreeChildren();
    u8 TickChildren();
    u32 RunFadeIn();
    u32 RunFadeInChildren();
    u32 RunFadeOut();
    u32 RunFadeOutChildren();
    void SetState(u8 state);
};
//Render() methods usually end (or sometimes only contain) this call.
#define RENDERCHILDREN() return this->RenderChildren(g, x0, y0, x1, y1) 

//destructors sometimes use this check for widgets in arrays and substructs
#define DestructWidget(w) \
if(w){\
((BaseWidget*)w)->~BaseWidget();\
w=NULL;\
}\


FontStruct* font_pointer=NULL;
u16 HresMirror=0;
u16 VresMirror=0;
float fadeFloatMirror=1.0;
u32 widget_control_dat=0;
u8 widget_control_timer=30;
u32 widget_control_buttons;

enum WidgetState{
    WidgetS_Inactive,
    WidgetS_Init,
    WidgetS_FadedIn,
    WidgetS_Running,
    WidgetS_Closing=5,
    WidgetS_Closed
};

//return for GetNumber()
enum WidgetNumber{
    WidgetN_Text,
    WidgetN_ClipText,
    WidgetN_ShadText,
    WidgetN_Menu,
    WidgetN_Borg8,
    WidgetN_ScrollArrows=7,
    WidgetN_ScrollMenu,
    WidgetN_ArrayMenu,
    WidgetN_ScrollList=11,
    WidgetN_Other
};