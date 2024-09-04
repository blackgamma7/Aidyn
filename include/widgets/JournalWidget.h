#include "widgets/WidgetMenu.h"

int some_char_to_int_parsing(int base,uint y);

u16 StringToFlag(char*);

//Widget used to display journal entries
class Journal : public WidgetMenu{
    public:
    BaseWidget *scrollList;
    BaseWidget *title;
    BaseWidget *unk84;
    WidgetChild0 *unk88;
    BaseWidget *background;
    private:
    void InitMenu(s16);
    u8 ShowTriggeredEntry(char*);
    void Load(s32);
};