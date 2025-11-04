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
    u8 Tick();
    u32 GetNumber();
};

struct WCSub{
    BaseWidget* selected;
    BaseWidget* journalLabel;
    BaseWidget* campLabel;
};

struct CityMarker {
    u16 borg;
    u16 x;
    u16 y;
};

BaseWidget* Calendar_DownFunc(BaseWidget*,BaseWidget*);
BaseWidget* Calendar_UpFunc(BaseWidget*,BaseWidget*);
BaseWidget* Calendar_LeftFunc(BaseWidget*,BaseWidget*);
BaseWidget* Calendar_RightFunc(BaseWidget*,BaseWidget*);
BaseWidget* Calendar_StartFunc(BaseWidget*,BaseWidget*);
BaseWidget* campMenuController(BaseWidget*,BaseWidget*);
BaseWidget* Calendar_BFunc(BaseWidget*,BaseWidget*);