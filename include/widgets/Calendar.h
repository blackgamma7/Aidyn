#include"widgets/WorldMap.h"

class WidgetCalendar: public WidgetMenu {
    public:
    WidgetMenuWorldMap *map;
    Color32 col0;
    Color32 col1;
    u8 waveTint;
    u8 waveAmmount; /* inverts if waveTint is 0 or 20 */
    u8 dayofMonth;
    u8 weekofMonth;
    u8 monthVal;
    BaseWidget *DayMarker;
    BaseWidget *monthTitle;
    WidgetCalendar();
    ~WidgetCalendar();
    u32 Init();
    Gfx* Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
    
};


