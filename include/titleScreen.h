#include "widgets/ContPakData.h"
//struct and protos relevant to title screen.

struct Flycam_entry { /* data entry for titlescreen flycam */
    u32  borg6;
    u16 unk4;
    u16 a;
    u16 unk8;
    u16 b;
    u16 unkc;
    u16 Deimos;
    u16 unk10;
    u16 Phobos;
};

struct flycamStruct {
    vec3f posTarget;
    vec3f aimTarget;
    vec3f pos;
    vec3f aim;
    short shortA;
    short shortB;
    short shortC;
    short ShortD;
};

class IntroMenu: public WidgetMenu{
    public:
    u8 alphaDelta;
    u8 blinkTimer;
    u8 alpha0;
    u8 alpha1;
    BaseWidget *field5_0x80;
    BaseWidget *field6_0x84;
    u8 pressStartVisible;
    IntroMenu();
    ~IntroMenu();
    void InitMenu();
    Gfx* Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1);
    u8 Tick();
    void BlinkTimer();
    void InitTitleCard();
    void ShowStartGameMenu();
    void InitOptionsMenu();
    void NamePlayer();
    void ShowContPakMenu();
    WidgetScrollMenu* StartGameMenu();
    void ProcessIntroMenu(BaseWidget*);
    void m8004b668(BaseWidget*);
    void m8004b6ac(BaseWidget*);
    BaseWidget* Control(controller_aidyn*);
    u32 GetNumber();
    BaseWidget* LeftFunc();
    BaseWidget* RightFunc();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    BaseWidget* BFunc();
};


enum IntroMenuStates{
    IntroM_StartGameMenu,
    IntroM_processIntoMenu,
    ItroM_State2,
    IntroM_ContPakMenu,
    ItroM_State4,
    ItroM_State5,
    IntroM_NewGame,
    IntroM_IntermediateGame, //debug only, start in Erromon
    IntroM_AdvancedGame, //Earlier Debug, start outside Goblin camp
    IntroM_StartGame, //debug only, start in forest, skip cinematics.
    ItroM_State10,
    IntroM_LoadGame,
};

struct IntroMenuSub {
    BaseWidget *StartGameMenu;
    u32 unk4;
    InputMenu *inputMenu;
    WidgetOptionsConfig* config;
    WidgetContPakData *pakDat;
    BaseWidget *titleShadow;
    BaseWidget *PressStart;
    BaseWidget *unk1c;
    BaseWidget *unk20;
    u8 menuState; //uses IntroMenuStates
};
#define IntroSub ((IntroMenuSub*)this->substruct)

void flycam_func(void);
void set_title_screen(void);
Gfx * RenderFlycam(Gfx *gfx);
u8 gameStart(Gfx**GG);
void TitleScreenInput(void);
void FlyCamClear(void);
