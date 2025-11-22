#include "widgets/Utilities.h"
#include "savefiles.h"
#include "widgets/handler.h"
#include "widgets/WidgetChoiceDia.h"
#include "widgets/WidgetChild6.h"

class WidgetTimed: public WidgetMenu{
    public:
    u32 timer;
    WidgetTimed(u32 t, buttonFunc AButton);
    ~WidgetTimed();
    u8 Tick();
    BaseWidget* Control(controller_aidyn*);
};

class WidgetContPakData : public WidgetMenu{
    public:
    SaveDatPointers saveDatsP[16];
    WidgetMenuChild *sliders;
    WidgetScrollMenu *scroll;
    void (*funcA)(void);
    void (*funcB)(void);
    u8 OtherState;
    u8 pfsErr;
    u8 saveSlot;
    u8 AidynSaveSlots;
    u8 unk290;
    u8 scrollInited;
    u16 unk292;
    u16 unk294;
    undefined field14_0x296;
    undefined field15_0x297;
    u32 titleIndex;
    WidgetBorg8 *titleWidget;
    WidgetChoiceDia *waitPrompt;
    u8 showingSaveFiles;
    Color32 col0;
    Color32 col1;
    Color32 col2;
    undefined field23_0x2b1;
    undefined field24_0x2b2;
    undefined field25_0x2b3;
    u32 attemptedRepair;
    u8 contStatus;
    undefined unk2b9;
    undefined unk2ba;
    undefined field30_0x2bb;
    WidgetHandler wHandler;
    SaveDatStruct *dataBuffer;
    s32 filenum;
    WidgetContPakData(u16,u16,void (*)(),void (*)(),u32,Color32*,Color32 *,Color32*);
    ~WidgetContPakData();
    u8 Tick();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    BaseWidget* AFunc();
    BaseWidget* BFunc();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    BaseWidget* LeftFunc();
    BaseWidget* RightFunc();
    BaseWidget* Control(controller_aidyn*);
    void m80086bd0();
    void GetPFSErr();
    void TryRepair();
    void EraseFile(u8);
    void m80086d30();
    BaseWidget* m80086d3c();
    void m80086d78();
    void FreeWidget(BaseWidget*);
    void m80086e08();
    void TestPak2();
    void PfsErrAction();
    void m80086F40();
    void ReadSaveFile();
    void m800871c8();
    void m80087230();
    void m80087260();
    void CheckContStatus();
    void m800873ac();
    void m800873f0();
    void m80087424();
    void SavingPrompt();
    void m80087548();
    void m8008759c();
    virtual void unk();
    virtual u32 ShowSaveFiles();
    virtual void LoadSaveFile(u8);
    virtual u32 vmE0(BaseWidget*);
    virtual u32 vmE8();
    virtual u32 vmF0();
    virtual u32 WriteSaveFile(u8);
    virtual void vm100();
    virtual void NewContPak();
    void PfsErrDevice();
    void CourrputPak();
    void DamagedPak();
    void ConfirmOverwrite(char*);
    void PfsErrBadRead();
    void PfsErrBadPak();
    void PfsErrNoPak();
    void PfsErrOK();
    void CorruptSaveFile(u8);
    void RepairFail();
    void RepairOK();
    void LoadSliders(SaveDatPointers *,u8);
    void ClearScrollMenu();
    void FreeWaitPrompt();
    void m80087c88();
    void ReadPakPrompt();
    void m80087ec0();
};

class WidgetContPakDataSave:public WidgetContPakData{
    public:
    WidgetContPakDataSave(u16,u16,void*,void*,Color32 *,Color32 *,Color32 *);
    ~WidgetContPakDataSave();
    void unk();
    u32 ShowSaveFiles();
    void LoadSaveFile(u8);
    u32 vmE0(BaseWidget*);
    void NewSaveFile();
    u32 vmE8();
    u32 vmF0();
    u32 WriteSaveFile(u8);
    void vm100();
    void LowSpaceWarn();
    void FullWarning();
    void NewContPak();
};
class WidgetContPakDataLoad: public WidgetContPakData{
    public:
    WidgetContPakDataLoad(u16,u16,void*,void*,Color32 *,Color32 *,Color32 *);
    ~WidgetContPakDataLoad();
    void unk();
    u32 ShowSaveFiles();
    void LoadSaveFile(u8);
    u32 vmE0(BaseWidget*);
    u32 vmF0();
};

WidgetText * ContPakTextWidget(char *txt,BaseWidget *(*AFunc)(BaseWidget *,BaseWidget *),u16 length);
WidgetText * ContPakTextWidget2(u16 param_1,char *txt,BaseWidget *(*AFunc)(BaseWidget *,BaseWidget *));
WidgetChoiceDia * FUN_80088a78(u16 ,char *);
WidgetChoiceDia *FUN_80088aac(void (*func)(BaseWidget*),WidgetHandler *handler,u16 choices,char *title,u16 var);
void open_mempak_menu(u32 ,u32 ,u16 ,u16,u32);
u32 appState_2(Gfx **);
byte appState2_control(void);
void appState2_Tick(Gfx **,u8);
u32 FUN_80088d80();
void make_mempak_menu(s16 ,s16 ,undefined4);
u32 FUN_80088e2c(void);

class ContPakWidget:public WidgetMenu{
    public:
    BaseWidget * field1_0x7c;
    WidgetScrollMenu *w80;
    u8 menuState;
    u8 pfserr;
    u8 fileNum;
    u8 windowLoaded;
    u32 BgShadow;
    WidgetHandler handler;
    u8 contStat;
    u8 unk95[3]; //align bytes?
    ContPakWidget(u32);
    u8 m80088f0c(BaseWidget *);
    void m80088f44();
    BaseWidget* AFunc();
    BaseWidget* BFunc();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    u8 Tick();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    BaseWidget* Control(controller_aidyn*);
    void ConfirmDelete(BaseWidget*);
    void ErasePakSave(BaseWidget*);
    void m8008937c();
    void m80089384(BaseWidget*);
    void GetPfsErr();
    void ErrSwitch();
    void LoadWindowCheck();
    void PrintMemcardFiles();
    void m800895d8();
    void m800895f4();
    void m80089668();
    void PfsOK();
    void PfsNoPak();
    void PfsNewPak();
    void PfsErr();
    void DeviceErr();
    void FatalErr();
    void m80089978(char*);
    void m80089a1c();
    void m80089a40();
    void m80089a64(u8);
    void m80089b0c(u8);
    void m80089b9c(u8);
    void LoadWindow();
    void PrintFreeSpace();
    void PrintFile(u8 ,char *,char *,u16);
    void PrintBlankFile(u8);
    void RunHandlerBFuncs();
    void CheckContStatus2();
    void RemoveWidget(BaseWidget*);
    void m8008a6dc();
};
BaseWidget * ContPak_DeleteMenu(BaseWidget *,BaseWidget *);
BaseWidget * ContPak_EraseMenu(BaseWidget *,BaseWidget *);
BaseWidget * ContPak_8008a738(BaseWidget *,BaseWidget *);
BaseWidget * ContPak_8008a768(BaseWidget *,BaseWidget *);
BaseWidget * ContPak_8008a790(BaseWidget *,BaseWidget *);
void FUN_8008a7b8(BaseWidget *);
void FUN_8008a848(BaseWidget *);
BaseWidget * FUN_8008a87c(BaseWidget *,BaseWidget *);
BaseWidget * FUN_8008a8a4(BaseWidget *,BaseWidget *);

WidgetContPakData * WContPakData_Save(u16 param_1,u16 param_2,void *param_3,
      Color32 *param_4,Color32 *param_5,Color32 *param_6);
WidgetContPakData * WContPakData_Load(u16 param_1,u16 param_2,void *param_3,
      void *param_4,Color32* param_5, Color32 *param_6,Color32 param_7);
BaseWidget * FUN_80085d64(BaseWidget *wo,BaseWidget *w1);
BaseWidget * FUN_80085da0(BaseWidget *wo,BaseWidget *w1);
BaseWidget * FUN_80085dcc(BaseWidget *wo,BaseWidget *w1);
BaseWidget * FUN_80085e08(BaseWidget *wo,BaseWidget *w1);
BaseWidget * FUN_80085e44(BaseWidget *w0,BaseWidget *w1);
BaseWidget * FUN_80085f08(BaseWidget *w0,BaseWidget *w1);
BaseWidget * FUN_80085fcc(BaseWidget *w0,BaseWidget *w1);
BaseWidget * FUN_80086018(BaseWidget *w0,BaseWidget *w1);
BaseWidget * FUN_80086054(BaseWidget *w0,BaseWidget *w1);
BaseWidget * FUN_80086080(BaseWidget *w0,BaseWidget *w1);
BaseWidget * FUN_800860cc(BaseWidget *w0,BaseWidget *w1);
BaseWidget * FUN_80086118(BaseWidget *w0,BaseWidget *w1);
BaseWidget * FUN_80086144(BaseWidget *w0,BaseWidget *w1);
BaseWidget * FUN_80086180(BaseWidget *w0,BaseWidget *w1);
BaseWidget * repeated_space_warning(BaseWidget *w0,BaseWidget *w1);

void FUN_80086290(BaseWidget *);
u32 FUN_800862c8(void);
BaseWidget * FUN_800862f4(u8 param_1,u16 param_2,char *txt,BaseWidget::buttonFunc param_4);


WidgetContPakData* contPakDat=NULL;
u16 gContPakDatTimer=0;

#define SaveFileMax 16