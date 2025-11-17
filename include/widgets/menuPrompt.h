#include "widgets/WidgetMenu.h"

//used for "first potion/spell" prompts
class WidgetMenuPrompt:public WidgetMenu{
    WidgetMenuPrompt(char *str,s16 x,s16 y,u8 r,u8 g,u8 b,u8 a);
    BaseWidget* AFunc();
    BaseWidget* BFunc();
    BaseWidget* StartFunc();
    void Close();
    ~WidgetMenuPrompt();
};