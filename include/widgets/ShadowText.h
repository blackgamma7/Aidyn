#include "widgets/BaseWidget.h"

struct WSTSub {
    char *txt;
    u16 len; //not initally set, but used in ChangeText()
    vec2f scale;
    s16 X;
    s16 Y;
    s16 XOff;
    s16 YOff;
    Color32 col;
    u32 unk1c;
};
//Text Class used during dialoug scenes. has Drop shadow.
class WidgetShadowText : public BaseWidget{
    public:
    WidgetShadowText(char*,u16);
    ~WidgetShadowText();
    Gfx * Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
    u16 GetWidth();
    u16 GetHeight();
    u8 Tick();
    u8 ChangeText(char*, u8);
    u32 GetNumber();
};

