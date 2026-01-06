#include "widgets/WidgetMenu.h"
#include "savefiles.h"
#include "GuiAnimation.h"

class WidgetSaveFile : public WidgetMenu {
    public:
    WidgetSaveFile* prev;
    WidgetSaveFile* next;
    inline WidgetSaveFile();
    ~WidgetSaveFile();
    virtual void unk();
    virtual void unk2();
    virtual void unk3();
};
// Widget for showing blank save slot (?)
class WidgetBlankFile: public WidgetSaveFile {
    public:
    BaseWidget* clipTxt;
    char *str;
    u16 newBoundX0;
    u16 newBoundY0;
    u16 newBoundX1;
    u16 newBoundY1;
    Color32 col94;
    u16 field10_0x98;
    u16 field11_0x9a;
    WidgetBorg8* arrows;
    WidgetBlankFile(char *str,u16 (*param_3) [4],Color32 *param_4,u16 param_5,u16 param_6);
    ~WidgetBlankFile();
    void Free();
    void SetArrow(u32 index);
    void SetEntry();
    void unk();
    void unk2();
};
class WidgetMenuChild:public WidgetMenu {
    public:
    WidgetSaveFile * field1_0x7c=NULL;
    WidgetSaveFile *currFile=NULL;
    WidgetSaveFile *prevFile=NULL;
    GuiAnimationManager aniManage=GuiAnimationManager(6);
    u32 currFileIndex;
    u32 fileCount;
    u32 canRender;
    WidgetMenuChild(u16 x0,u16 y0,u16 x1,u16 y1);
    ~WidgetMenuChild();
    Gfx * Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
    u8 Tick();
    s32 AddFileWidget(WidgetSaveFile *param_2);
    void FreeMenu();
    void ShiftRight();
    void ShiftLeft();
    WidgetSaveFile* getCurrFile();
    bool HasPrevFile();
    void MoveWidgets();
    void SetIndex(s32 param_2);
    void RemovePrevFile();

};

class ControllerPakSliders: public WidgetSaveFile {
    public:
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