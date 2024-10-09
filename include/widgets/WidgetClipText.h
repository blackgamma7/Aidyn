#include "widgets/BaseWidget.h"

class WidgetClipText : public BaseWidget {
public:
  WidgetClipText(char* str, u16 len);
  Gfx * Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
  u16 GetWidth();
  u16 GetHeight();
  u8 Tick();
  u8 SetText(char* str, u8 b);
  u32 GetNumber();
};

typedef struct WidgetSubstruct_ClipText {
char* str;
u16 maxLen;
f32 scaleX;
f32 scaleY;
u16 unk10;
u16 unk12;
};