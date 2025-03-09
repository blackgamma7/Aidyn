#include "cinematics.h"

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