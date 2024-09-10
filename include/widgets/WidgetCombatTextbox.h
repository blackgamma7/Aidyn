#include "widgets/WidgetCinematicText.h"

class WidgetCombatTextbox : public WidgetCinematicText{
    WidgetBorg8 *speakerPortrait;
    WidgetBorg8 *portraitBG;
    u32 speakerId;
    int locked;
};