#include "cinematics.h"
#include "itemID.h"

void CombatTextboxWidget_Init();
void CombatTextboxWidget_Free();
Gfx * CombatTextboxWidget_Tick(Gfx *,u8);
void CombatTextboxWidget_SetText(char *);
void CombatTextboxWidget_Lock(ItemID);

//Extension of cinematic caption box, gives info on fight.
class WidgetCombatTextbox : public WidgetCinematicText{
    public:
    WidgetBorg8 *speakerPortrait;
    WidgetBorg8 *portraitBG;
    u32 speakerId;
    int locked;
    WidgetCombatTextbox();
    ~WidgetCombatTextbox();
    void SetPortrait(u32);
    void SetText(char*);
    void Lock();
};

WidgetCombatTextbox* gWidgetCombatTextboxP=NULL;
ItemID gCombatTextboxSpeaker=0;