#include "widgets/BaseWidget.h"
#include "stringN64.h"

class WidgetText : public BaseWidget{
    public:
    WidgetText(char* str, u16 len);
    Gfx * Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
    u16 GetWidth();
    u16 GetHeight();
    u8 Tick();
    u8 Modify(char *newStr,u8 b);
    u32 GetNumber();
};
struct widgetTextSubstruct{
    char* str;
    u16 len;
    vec2f scale;
};
//New widgetText with default length
#define WText(txt) new WidgetText(txt,400)
//New widgetText with calculated length
#define WTextSafe(txt) new WidgetText(txt,strlen(txt)+1)