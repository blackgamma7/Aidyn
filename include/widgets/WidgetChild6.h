#include "widgets/WidgetMenu.h"
#include "savefiles.h"
#include "unkGuiSubstruct.h"

class WidgetChild10 : public WidgetMenu {
    public:
    BaseWidget* unk7c;
    BaseWidget* unk80;
    inline WidgetChild10();
    ~WidgetChild10();
    void unk();
    void unk2();
    void unk3();
};
// Widget for showing blank save slot (?)
class WidgetChild6: public WidgetChild10 {
    public:
    BaseWidget* unk84;
    char *str;
    u16 newx;
    u16 newy;
    u16 field7_0x90;
    u16 field8_0x92;
    Color32 col94;
    u16 field10_0x98;
    u16 field11_0x9a;
    WidgetBorg8* field12_0x9c;
    WidgetChild6(char *str,u16 (*param_3) [4],Color32 *param_4,u16 param_5,u16 param_6);
    ~WidgetChild6();
    void Free();
    void SetArrow(u32 index);
    void SetEntry();
    void unk();
    void unk2();
};
class WidgetMenuChild:public WidgetMenu {
    u32 field1_0x7c;
    WidgetChild10 *field2_0x80;
    WidgetChild10 *field3_0x84;
    UnkGuiSubstruct field4_0x88;
    u32 field5_0x98;
    u32 field6_0x9c;
    u32 field7_0xa0;
};

class ControllerPakSliders: public WidgetChild10 {
    SaveDatPointers *saveDat;
    WidgetBorg8 *screenshotWidget;
    Borg8Header *screenshotBorg8;
    WidgetClipText *PlayerName;
    WidgetClipText* TimePlayed;
    u32 isEntrySet;
    WidgetBorg8 *PartyPortraits[4];
    u16 unkBounds[4];
    Color32 childCol;
    WidgetBorg8 *arrows;
    ControllerPakSliders(SaveDatPointers *dat,s16 *bounds,Color32 *color);
    ~ControllerPakSliders();
    void Free();
    Gfx * Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
    void unk();
    void unk2();
    void SetArrow(u32 index, s16 x, s16 y);
    void SetEntry();
    WidgetBorg8 * GetPortrait(int index);
};