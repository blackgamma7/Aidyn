#include "widgets/BaseWidget.h"

// widget type used for displaying icons and images.
class WidgetBorg8 : public BaseWidget {
public:
WidgetBorg8(Borg8header*);
};

//macro to make blank widget
#define WigetB8Blank new WidgetBorg8(NULL)
//macro to make widget from Borg8 Index
#define WidgetB8(index) new WidgetBorg8(loadBorg8(index))
//macro to make portrait widget from entityID
#define WidgetB8Port(id) WidgetB8(gEntityDB->GetPortrait(id))
//macro to make party portrait widget from index
#define WidgetB8PartyPort(index) WidgetB8Port(PARTY->Members[index]->ID)