#include "GhidraDump.h"

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
    ~BaseWidget();
    u16 GetWidth();
    u16 GetHeight();
    u32 GetNumber();
    u8 Tick();
    u8 Link(BaseWidget* other);
    u8 Unlink(BaseWidget* other);
    Gfx* Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1);
    void SetColor(u8 r, u8 g, u8 b, u8 a);
    void* Controlfunc(controller_aidyn* input);
    void* UpFunc(BaseWidget* Sel);
    void* DownFunc(BaseWidget* Sel);
    void* LeftFunc(BaseWidget* Sel);
    void* RightFunc(BaseWidget* Sel);
    void* AFunc(BaseWidget* Sel);
    void* Bfunc(BaseWidget* Sel);
    void* ZFunc(BaseWidget* Sel);
    void* LFunc(BaseWidget* Sel);
    void* RFunc(BaseWidget* Sel);
    void* StartFunc(BaseWidget* Sel);
    void* CUPFunc(BaseWidget* Sel);
    void* CDownFunc(BaseWidget* Sel);
    void* CLeftFunc(BaseWidget* Sel);
    void* CRightFunc(BaseWidget* Sel);
};