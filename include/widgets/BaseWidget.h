#include "GhidraDump.h"
#include "Controller.h"

// Base Class for almost all UI Elements
class BaseWidget{
public:
    u8 (*fadeIn)(BaseWidget*); 
    u8 (*fadeOut)(BaseWidget*);
    void* (*UpButtonFunc)(BaseWidget*, BaseWidget*);
    void* (*DownButtonFunc)(BaseWidget*, BaseWidget*);
    void* (*LeftButtonFunc)(BaseWidget*, BaseWidget*);
    void* (*RightButtonFunc)(BaseWidget*, BaseWidget*);
    void* (*AbuttonFunc)(BaseWidget*, BaseWidget*);
    void* (*BButtonFunc)(BaseWidget*, BaseWidget*);
    void* (*StartButtonFunc)(BaseWidget*, BaseWidget*);
    void* (*LButtonFunc)(BaseWidget*, BaseWidget*);
    void* (*RButtonFunc)(BaseWidget*, BaseWidget*);
    void* (*ZButtonFunc)(BaseWidget*, BaseWidget*);
    void* (*CUpButtonFunc)(BaseWidget*, BaseWidget*);
    void* (*CDownButtonFunc)(BaseWidget*, BaseWidget*);
    void* (*CLeftButtonFunc)(BaseWidget*, BaseWidget*);
    void* (*CRightButtonFunc)(BaseWidget*, BaseWidget*);
    void *substruct; /* changes for each widget type */
    BaseWidget *link0;
    BaseWidget *link1;
    BaseWidget *link2;
    BaseWidget *link3;
    BaseWidget *link4;
    Color32 col;
    byte var5C;
    ushort var5E; //changes for each widget type.
    s16 x;
    s16 y;
    ushort boundX0;
    ushort boundX1;
    ushort boundY0;
    ushort boundY1;
    Borg8header *borg8;
    byte state;
    ushort height;
    ushort width;
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
    virtual BaseWidget* CUPFunc();
    virtual BaseWidget* CDownFunc();
    virtual BaseWidget* CLeftFunc();
    virtual BaseWidget* CRightFunc();
};