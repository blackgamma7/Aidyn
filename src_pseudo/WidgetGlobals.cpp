#include "globals.h"

// 2 widget-related values. 
//not sure which script would init them, so here's a seperate one.

void(*freeWidgetFunc)(BaseWidget*)=NULL;
BaseWidget* PTR_800ed504=NULL;