#include "widgets/WidgetMenu.h"
#include "widgets/WidgetBorg8.h"
#include "widgets/WidgetClipText.h"
#include "widgets/WidgetScrollList.h"
#include "widgets/WidgetScrollArrows.h"

int some_char_to_int_parsing(int base,uint y);

u16 StringToFlag(char*);

//Widget used to display journal entries
class Journal : public WidgetMenu{
    public:
    WidgetScrollList *scrollList;
    WidgetBorg8 *title;
    BaseWidget *Arrow;
    WidgetScrollArrows *unk88;
    WidgetBorg8 *background;
    private:
    void InitMenu(s16);
    u8 ShowTriggeredEntry(char*);
    void Load(s32);
};