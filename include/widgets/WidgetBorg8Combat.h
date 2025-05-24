#include "widgets/WidgetBorg8.h"

//used for combat portraits and radar blips
class WidgetBorg8Combat: public WidgetBorg8 {
u32 visible;
WidgetBorg8Combat(Borg8Header *img,s16 posx,s16 posy,u32 vis);
~WidgetBorg8Combat();
Gfx* Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
};