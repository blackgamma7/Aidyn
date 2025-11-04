#include "widgets/Utilities.h"
#include "widgets/WidgetScrollArrows.h"

int some_char_to_int_parsing(int base,uint y);

u16 StringToFlag(char*);

//Widget used to display journal entries
class Journal : public WidgetMenu{
    public:
    WidgetScrollList *scrollList;
    WidgetBorg8 *arrowU;
    BaseWidget *arrowD;
    WidgetScrollArrows *Arrows;
    WidgetBorg8 *background;
    Journal(s16);
    ~Journal();
    private:
    void InitMenu(s16);
    u8 ShowTriggeredEntry(char*);
    void Load(s32);
    u8 Tick();
    BaseWidget* Control(controller_aidyn*);
    Gfx * Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
    u32 GetNumber();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    BaseWidget* AFunc();
    BaseWidget* BFunc();
    BaseWidget* StartFunc();

};

u8 Journal_FadeIn(BaseWidget*);
u8 Journal_FadeOut(BaseWidget*);