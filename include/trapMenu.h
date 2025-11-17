#include "widgets/WidgetChoiceDia.h"
#include "vobjects.h"

namespace TrapMenu{
    bool InitMenu(voxelObject* v);
    u32 AttemptDisarm();
    BaseWidget* AttemptDisarm(BaseWidget*,BaseWidget*);
    BaseWidget* CloseMenu(BaseWidget*,BaseWidget*);
    void TrapDisarmed();
    void TrapExploded();
    BaseWidget * TakeDamage(s16,char *);
    u16 * GetTrapLV(voxelObject *param_1);
    
}