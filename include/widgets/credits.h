#include "widgets/Utilities.h"
#include "n64Borg.h"
class WidgetCredits: public WidgetMenu {
    public:
    u8 creditState;
    u8 field2_0x7d[3];
    BaseWidget *currChild;
    BaseWidget *THEEND;
    u8 timer;
    u8 unk89;
    u8 scrollSpeed;
    u8 unk8b;
    Borg12Header *bgm;
    u8 bgmIndex;
    s32 bgmID;
    float BGMVol;
    float SFXVol;
    WidgetCredits();
    ~WidgetCredits();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    u8 Tick();
    void State0();
    void State1();
    void State2();
    void State3();
    BaseWidget* BFunc();
    BaseWidget* AFunc();
    BaseWidget* StartFunc();
    u32 GetNumber();
};

