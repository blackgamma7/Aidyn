#include "eventFlag.h"
#include "widgets/WidgetText.h"

//Debug feature to view and change event flags.

//class for getting strings for flags. Not sure why it needed to be a class...
class GSMClass{
    public:
    virtual void vMethA(u16 i, char* str);
    virtual void vMethB(u16 i, char* str);
    virtual void vMethC(u16 i, char* str);
};

//only used for child showing event flags in debug version
class WidgetBufferedMenu:public BaseWidget{
    public:
    GSMClass* txtGetter;
    u8 unk80[2];
    u8 reds[2];
    u8 blues[2];
    u8 greens[2];
    u8 alphas[2];
    u8 unk8a[2];
    Color32 col8C;
    s16 unk90;
    s16 unk92;
    s16 unk94;
    s16 unk96;
    WidgetText textWidgets[20];
    WidgetText* textWidgetsP[20];
    u16 listBottom;
    u16 unka9a;
    s16 unka9c;
    s16 unka9e;
    WidgetText titleWidget;
    char* txtIn;
    WidgetBufferedMenu(GSMClass *obj,u16 param_3,u16 param_4,u16 *bounds,s16 *titleBounds,
          Color32 *colA,Color32 *ColB,Color32 *colC,Color32 *colD);
    ~WidgetBufferedMenu();
    u8 Tick();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    BaseWidget* Control(controller_aidyn*);
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    BaseWidget* CLeftFunc();
    BaseWidget* CRightFunc();
    BaseWidget* CUpFunc();
    BaseWidget* CDownFunc();
    BaseWidget* AFunc();
    BaseWidget* BFunc();
    virtual u8 LCUp();
    virtual u8 LCDown();
    void UpdateTexts();
    u32 GetNumber();
};
//largely unchanged child of WidgetBufferedMenu. only used for showing event flags in debug version
class WBMGSM:public WidgetBufferedMenu{
    public:
    WBMGSM(GSMClass *obj,u16 param_3,u16 param_4,u16 *bounds,s16 *titleBounds,
          Color32 *colA,Color32 *ColB,Color32 *colC,Color32 *colD);
    ~WBMGSM();
};

char** debug_switch_labels=NULL;
char**boolean_labels=NULL;
char**cheatStatus_labels=NULL;
u8 gamestatemod_byte=0;
void*PTR_800e61c0=NULL;
EventFlag* gamestatemod_pointer=NULL;
WBMGSM* gBufferedMenuP=NULL;
u8 DAT_800e61cc=0;
GSMClass* gGSMClassP=NULL;

bool debug_gamestatefunnel_sub();
u8 ScreenFademode_10(Gfx **GG);
s32 FUN_80005500(EventFlag *param_1,EventFlag *param_2);
void quicksort_gamestatemod(void **toSort,u32 arraySize);
void load_gamestatemod_dat();
void FUN_80005610();
void gamestatemod_free();

