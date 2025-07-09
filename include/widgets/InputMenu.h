#include "widgets/WidgetMenu.h"
#include "widgets/WidgetArrayMenu.h"
#include "widgets/WidgetBorg8.h"

struct InputWidgetSubStruct {
    WidgetArrayMenu *arrayMenu;
    char *output;
    char *entry;
    BaseWidget *cursor;
    u8 entryIndex;
};

class InputMenu: public WidgetMenu{
    public:
    u32 unk7c;
    InputMenu(char*);
    ~InputMenu();
    void InitMenu(char*);
    void SetCurrentName(char*);
    Gfx * Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
    u8 Tick();
    u32 GetNumber();
};

BaseWidget* InputMenu_LeftButton(BaseWidget*,BaseWidget*);
BaseWidget* InputMenu_RightButton(BaseWidget*,BaseWidget*);
BaseWidget* InputMenu_UpButton(BaseWidget*,BaseWidget*);
BaseWidget* InputMenu_DownButton(BaseWidget*,BaseWidget*);
BaseWidget* InputMenu_AButton(BaseWidget*,BaseWidget*);
BaseWidget* InputMenu_BButton(BaseWidget*,BaseWidget*);
BaseWidget* InputMenu_StartButton(BaseWidget*,BaseWidget*);

#define IMNameLength 10

#define UpdateCursorPos(IMSub,AMSub)\
  IMSub->cursor->SetCoords(\
  (AMSub->entries[AMSub->entryPos]->x + (AMSub->entries[AMSub->entryPos]->GetWidth() >> 1) - (IMSub->cursor->GetWidth() >> 1)),\
  (AMSub->entries[AMSub->entryPos]->y + (AMSub->entries[AMSub->entryPos]->GetHeight() >> 1) - (IMSub->cursor->GetHeight() >> 1)))