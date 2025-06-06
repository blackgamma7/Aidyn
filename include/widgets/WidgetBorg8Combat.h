#include "widgets/WidgetBorg8.h"

//used for combat portraits and radar blips
class WidgetBorg8Combat: public WidgetBorg8 {
  public:
  u32 visible;
  inline WidgetBorg8Combat(Borg8Header *img,u32 vis):WidgetBorg8(img){this->visible=vis;}
  ~WidgetBorg8Combat();
  Gfx* Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
};